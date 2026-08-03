local M = {}

M.palette = {
  bg0 = "#11121D",
  bg1 = "#1A1B2A",
  bg2 = "#212234",
  bg3 = "#353945",
  bg4 = "#4A5057",
  bg5 = "#282C34",

  bg_blue = "#9FBBF3",
  bg_green = "#98C379",
  bg_red = "#FE6D85",

  black = "#06080A",
  blue = "#7199EE",
  cyan = "#38A89D",
  green = "#95C561",
  grey = "#4A5057",
  orange = "#F6955B",
  purple = "#A485DD",
  red = "#EE6D85",
  yellow = "#D7A65F",

  fg = "#A0A8CD",
  none = "NONE",

  diff_add = "#1E2326",
  diff_blue = "#2A3A5A",
  diff_change = "#262B3D",
  diff_delete = "#281B27",
  diff_green = "#587738",
  diff_red = "#773440",
  diff_text = "#1C4474",
}

function M.lualine()
  return vim.g.colors_name
end

function M.custom_palette(pal)
  vim.tbl_extend("force", pal, M.palette)
  return pal
end

return M
