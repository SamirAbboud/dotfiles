local colors = require("user.colors.colors")
local transparent = true

return {
  "folke/tokyonight.nvim",
  opts = {
    style = "storm",
    transparent = transparent,
    styles = {
      sidebars = transparent and "transparent" or "dark",
      floats = transparent and "transparent" or "dark",
    },
    on_colors = function(c)
      c.border = c.fg_gutter
    end,
    on_highlights = function(hl, c)
      if not transparent then
        return
      end

      hl.TelescopeNormal = {
        bg = colors.palette.none,
      }

      hl.TelescopeBorder = {
        bg = colors.palette.none,
        fg = c.border,
      }

      hl.TelescopePromptBorder = {
        bg = colors.palette.none,
        fg = c.border,
      }

      hl.TelescopeResultsTitle = {
        bg = colors.palette.bg2,
        fg = c.blue,
      }

      hl.TelescopePreviewTitle = {
        bg = colors.palette.bg2,
        fg = c.blue,
      }

      hl.TelescopePromptTitle = {
        bg = colors.palette.bg2,
        fg = c.blue,
      }

      hl.TelescopeSelection = {
        bg = c.bg_highlight,
        fg = c.magenta,
      }

      hl.TelescopeSelectionCaret = {
        bg = c.bg_highlight,
        fg = c.magenta,
      }

      hl.TelescopePromptPrefix = {
        fg = c.orange,
      }
    end,
  },
}
