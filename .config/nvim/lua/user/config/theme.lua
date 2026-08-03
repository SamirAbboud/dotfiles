local theme_file = vim.fs.joinpath(vim.fn.stdpath("state"), "theme")

local themes = {
  "tokyodark",
  "tokyonight",
  "catppuccin",
  "everforest",
  "gruvbox",
  "nord",
  "onedark",
}

local colorschemes = {
  nord = "nord",
}

local current = "tokyonight"

local function load_theme()
  local file = io.open(theme_file, "r")
  if not file then
    return current
  end

  local theme = file:read("*l")
  file:close()

  if vim.tbl_contains(themes, theme) then
    return theme
  end

  return current
end

local function save_theme(theme)
  local file = assert(io.open(theme_file, "w"))
  file:write(theme)
  file:close()
end

local function find_theme(name)
  for i, theme in ipairs(themes) do
    if theme == name then
      return i
    end
  end

  return 1
end

local function set_theme(name, notify)
  current = name

  vim.cmd.colorscheme(colorschemes[name] or name)
  save_theme(name)

  if notify then
    vim.notify(("Theme: %s"):format(name), vim.log.levels.INFO, {
      title = "Colorscheme",
    })
  end
end

local function next_theme()
  local index = find_theme(current)
  index = index % #themes + 1

  set_theme(themes[index], true)
end

vim.keymap.set("n", "<leader>ut", next_theme, {
  desc = "Cycle themes",
})

vim.api.nvim_create_user_command("Theme", function(opts)
  if opts.args == "" then
    next_theme()
    return
  end

  if not vim.tbl_contains(themes, opts.args) then
    vim.notify(("Unknown theme: %s"):format(opts.args), vim.log.levels.ERROR)
    return
  end

  set_theme(opts.args, true)
end, {
  nargs = "?",
  complete = function()
    return themes
  end,
})

current = load_theme()
set_theme(current, false)
