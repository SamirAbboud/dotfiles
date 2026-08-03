local colors = require("user.colors.colors")
local transparent = true

return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = transparent,
    custom_highlights = function(c)
      if not transparent then
        return {}
      end

      return {
        TelescopeNormal = {
          bg = colors.palette.none,
        },
        TelescopeBorder = {
          bg = colors.palette.none,
          fg = colors.palette.bg3,
        },
        TelescopeResultsTitle = {
          bg = colors.palette.bg2,
          fg = c.blue,
        },
        TelescopePreviewTitle = {
          bg = colors.palette.bg2,
          fg = c.blue,
        },
        TelescopePromptTitle = {
          bg = colors.palette.bg2,
          fg = c.blue,
        },
        TelescopeSelection = {
          bg = colors.palette.bg1,
          fg = c.mauve,
        },
        TelescopeSelectionCaret = {
          bg = colors.palette.bg1,
          fg = c.mauve,
        },
        TelescopePromptPrefix = {
          fg = c.peach,
        },
      }
    end,
  },
}
