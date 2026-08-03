local colors = require("user.colors.colors")
local transparent = true

local custom_highlights = {}

if transparent then
  custom_highlights = {
    TabLineFill = { bg = colors.palette.none },
    TabLine = { bg = colors.palette.none },
    TabLineSel = { bg = colors.palette.none },
  }
end

return {
  "tiagovla/tokyodark.nvim",
  opts = {
    transparent_background = transparent,
    custom_palette = colors.custom_palette,
    custom_highlights = custom_highlights,
  },
}
