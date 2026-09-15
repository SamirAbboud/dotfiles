local M = {}

local colors = require("config.colors")
local state_file = vim.fs.joinpath(vim.fn.stdpath("state"), "theme")

local themes = { "tokyodark", "tokyonight", "catppuccin", "everforest", "gruvbox", "nord", "onedark" }
local colorschemes = { nord = "nord" }

-- Helpers: Persistent state via native readfile/writefile
local function load_state()
  local lines = vim.fn.filereadable(state_file) == 1 and vim.fn.readfile(state_file) or {}
  return vim.tbl_contains(themes, lines[1]) and lines[1] or "tokyonight"
end

local function save_state(theme)
  vim.fn.writefile({ theme }, state_file)
end

-- Core Engine
local current = load_state()

local function set_theme(name, notify)
  package.loaded["pack.specs.colorschemes." .. name] = nil
  pcall(require, "pack.specs.colorschemes." .. name)

  local ok, err = pcall(vim.cmd.colorscheme, colorschemes[name] or name)
  if not ok then
    return vim.notify(("Failed to set '%s': %s"):format(name, err), vim.log.levels.ERROR)
  end

  current = name
  save_state(name)

  -- Refresh Lualine dynamically
  pcall(function() require("lualine").setup({ options = { theme = "auto" } }) end)

  if notify then
    vim.notify("Theme: " .. name, vim.log.levels.INFO, { title = "Colorscheme" })
  end
end

local function cycle_theme()
  local idx = (vim.iter(ipairs(themes)):find(function(_, t) return t == current end) or 1)
  set_theme(themes[(idx % #themes) + 1], true)
end

-- Public API
function M.reload()
  set_theme(current, false)
end

-- User Commands & Keymaps
vim.api.nvim_create_user_command("Theme", function(opts)
  if opts.args == "" then return cycle_theme() end
  if not vim.tbl_contains(themes, opts.args) then
    return vim.notify("Unknown theme: " .. opts.args, vim.log.levels.ERROR)
  end
  set_theme(opts.args, true)
end, { nargs = "?", complete = function() return themes end })

vim.api.nvim_create_user_command("ToggleTransparency", colors.toggle_transparency, {})

vim.keymap.set("n", "<leader>ut", cycle_theme, { desc = "Cycle themes" })
vim.keymap.set("n", "<leader>ub", colors.toggle_transparency, { desc = "Toggle transparency" })

-- Initial startup execution
set_theme(current, false)

return M
