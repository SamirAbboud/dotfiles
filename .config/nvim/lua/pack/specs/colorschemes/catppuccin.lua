local colors = require("config.colors")

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = colors.transparent,
  custom_highlights = function(c)
    local hl = {
      -- PackList highlights (Opaque / Default mode)
      PackListNormal = { bg = c.mantle },
      PackListBorder = { bg = c.mantle, fg = colors.palette.bg3 },
      PackListTitle = { bg = colors.palette.bg2, fg = c.blue, style = { "bold" } },
      -- cmp & LSP Float highlights (Opaque mode)
      Pmenu = { bg = c.mantle, fg = c.text },
      PmenuSel = { bg = c.surface1, fg = c.mauve, style = { "bold" } },
      CmpBorder = { bg = c.mantle, fg = colors.palette.bg3 },
      CmpDocBorder = { bg = c.mantle, fg = colors.palette.bg3 },
      NormalFloat = { bg = c.mantle, fg = c.text },
      FloatBorder = { bg = c.mantle, fg = colors.palette.bg3 },
    }

    if not colors.transparent then
      return hl
    end

    -- Transparent mode overrides
    hl.PackListNormal = { bg = colors.palette.none }
    hl.PackListBorder = { bg = colors.palette.none, fg = colors.palette.bg3 }

    -- cmp & LSP Float overrides (Transparent mode)
    hl.Pmenu = { bg = colors.palette.none, fg = c.text }
    hl.CmpBorder = { bg = colors.palette.none, fg = colors.palette.bg3 }
    hl.CmpDocBorder = { bg = colors.palette.none, fg = colors.palette.bg3 }
    hl.NormalFloat = { bg = colors.palette.none, fg = c.text }
    hl.FloatBorder = { bg = colors.palette.none, fg = colors.palette.bg3 }

    -- Telescope Highlights (Transparent mode)
    hl.TelescopeNormal = { bg = colors.palette.none }
    hl.TelescopeBorder = { bg = colors.palette.none, fg = colors.palette.bg3 }
    hl.TelescopeResultsTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopePreviewTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopePromptTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopeSelection = { bg = colors.palette.bg1, fg = c.mauve }
    hl.TelescopeSelectionCaret = { bg = colors.palette.bg1, fg = c.mauve }
    hl.TelescopePromptPrefix = { fg = c.peach }

    return hl
  end,
})
