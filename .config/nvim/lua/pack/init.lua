local M = {}

local plugin_dir = vim.fn.stdpath("data") .. "/plugins"

function M.install(item)
  if not item.repo then
    return
  end

  local name = item.name or item.repo:match(".*/(.*)")
  local install_path = plugin_dir .. "/" .. name

  -- Git clone if the directory doesn't exist
  if vim.fn.isdirectory(install_path) == 0 then
    vim.notify("Cloning " .. name .. "...", vim.log.levels.INFO)
    local url = "https://github.com/" .. item.repo .. ".git"
    vim.fn.system({ "git", "clone", "--depth", "1", url, install_path })
  end

  -- Explicitly prepend the plugin path to Neovim's runtime path
  vim.opt.rtp:prepend(install_path)
end

function M.clean()
  local plugins = require("pack.plugins")
  local active_names = {}

  -- Register names of plugins that are explicitly NOT disabled
  for _, item in ipairs(plugins) do
    if not item.disabled and item.repo then
      local name = item.name or item.repo:match(".*/(.*)")
      active_names[name] = true
    end
  end

  local handle = vim.uv.fs_scandir(plugin_dir)
  if not handle then
    return
  end

  while true do
    local name, type = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end

    -- Delete subdirectories in plugin_dir that are no longer active
    if type == "directory" and not active_names[name] then
      local target_path = plugin_dir .. "/" .. name
      vim.fn.delete(target_path, "rf")
      vim.notify("Removed unused/disabled plugin directory: " .. name, vim.log.levels.WARN)
    end
  end
end

function M.update()
  local plugins = require("pack.plugins")

  for _, item in ipairs(plugins) do
    if not item.disabled and item.repo then
      local name = item.name or item.repo:match(".*/(.*)")
      local path = plugin_dir .. "/" .. name

      if vim.fn.isdirectory(path) == 1 then
        vim.notify("Updating " .. name .. "...", vim.log.levels.INFO)
        vim.fn.system({ "git", "-C", path, "pull", "--ff-only" })
      end
    end
  end
  vim.notify("Plugin updates complete!", vim.log.levels.INFO)
end

-- Set up default highlight links (overridable by colorschemes)
local function setup_highlights()
  local colors = require("config.colors")

  if colors.transparent then
    -- Force true background transparency regardless of theme load order
    vim.api.nvim_set_hl(0, "PackListNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PackListBorder", { bg = "NONE", fg = "#525252" })
  else
    vim.api.nvim_set_hl(0, "PackListNormal", { link = "NormalFloat", default = true })
    vim.api.nvim_set_hl(0, "PackListBorder", { link = "FloatBorder", default = true })
  end

  vim.api.nvim_set_hl(0, "PackListTitle", { link = "FloatTitle", default = true })
end

function M.list()
  setup_highlights()

  local plugins = require("pack.plugins")

  -- Window dimensions (80% width, 70% height)
  local width = math.min(math.floor(vim.o.columns * 0.8), 100)
  local height = math.min(math.floor(vim.o.lines * 0.7), 30)

  -- Center text helper
  local function center_text(str)
    local padding = math.floor((width - #str) / 2)
    if padding < 0 then
      return str
    end
    return string.rep(" ", padding) .. str
  end

  local header_title = "=== Package Manager Plugins ==="
  local lines = { center_text(header_title), "" }

  local enabled_count = 0
  local disabled_count = 0

  for _, item in ipairs(plugins) do
    local repo = item.repo or "Unknown"
    local status = item.disabled and " [DISABLED]" or " [ACTIVE]"
    local spec_info = item.spec and (" (spec: " .. item.spec .. ")") or ""

    if item.disabled then
      disabled_count = disabled_count + 1
    else
      enabled_count = enabled_count + 1
    end

    table.insert(lines, string.format(" %-40s %-12s %s", repo, status, spec_info))
  end

  table.insert(lines, "")
  local summary = string.format("Total: %d | Active: %d | Disabled: %d", #plugins, enabled_count, disabled_count)
  table.insert(lines, center_text(summary))

  -- Display in floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
    title = " Pack List ",
    title_pos = "center",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.wo[win].winblend = 0
  vim.wo[win].winhl = "Normal:PackListNormal,FloatBorder:PackListBorder,FloatTitle:PackListTitle"

  -- Quick close keymaps
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end

function M.setup()
  local plugins = require("pack.plugins")

  for _, item in ipairs(plugins) do
    -- Skip plugin execution if disabled = true
    if not item.disabled then
      -- 1. Ensure plugin is downloaded and registered on rtp
      M.install(item)

      -- 2. Safely load the configuration spec if provided
      if item.spec then
        local ok, err = pcall(require, item.spec)
        if not ok then
          vim.notify("Error loading " .. item.spec .. ": " .. err, vim.log.levels.ERROR)
        end
      end
    end
  end

  -- Load global/grouped utility and theme specs after all paths are on rtp
  pcall(require, "pack.specs.utilities")
  pcall(require, "pack.specs.colorscheme")

  -- Define convenience user commands
  vim.api.nvim_create_user_command("PackClean", function()
    M.clean()
  end, { desc = "Remove disabled/unused plugin directories" })

  vim.api.nvim_create_user_command("PackUpdate", function()
    M.update()
  end, { desc = "Git pull all active plugins" })

  vim.api.nvim_create_user_command("PackList", function()
    M.list()
  end, { desc = "List all plugins and their load status" })

end

return M
