local theme_file = vim.fs.joinpath(vim.fn.stdpath("state"), "theme")

local default = "tokyonight"
local load_all = true

local themes = {
  "tokyodark",
  "tokyonight",
  "catppuccin",
  "everforest",
  "gruvbox",
  "nord",
  "onedark",
}

local function current_theme()
  local file = io.open(theme_file, "r")
  if not file then
    return default
  end

  local theme = file:read("*l")
  file:close()

  if theme and theme ~= "" then
    return theme
  end

  return default
end

if load_all then
  local specs = {}

  for _, theme in ipairs(themes) do
    table.insert(specs, require("user.plugins.colorschemes." .. theme))
  end

  return specs
end

return {
  require("user.plugins.colorschemes." .. current_theme()),
}
