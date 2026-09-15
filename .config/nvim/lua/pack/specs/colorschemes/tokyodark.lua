local colors = require("config.colors")

local border = "#4a5268"

local custom_highlights = {
  -- Telescope Highlights
  TelescopePromptBorder = { fg = border },
  TelescopeResultsBorder = { fg = border },
  TelescopePreviewBorder = { fg = border },

  -- Package Manager Floating Window
  PackListBorder = { fg = border },
  PackListTitle = { bg = "#21222d", fg = "#ee6d85", bold = true },

  -- cmp Completion Menu Highlights
  Pmenu = { bg = colors.transparent and colors.palette.none or "#11121d", fg = "#a9b1d6" },
  PmenuSel = { bg = "#21222d", fg = "#a9b1d6", bold = true },
  CmpBorder = { bg = colors.transparent and colors.palette.none or "#11121d", fg = border },
  CmpDocBorder = { bg = colors.transparent and colors.palette.none or "#11121d", fg = border },

  -- LSP Hover Floating Window Highlights (Shift + K)
  NormalFloat = { bg = colors.transparent and colors.palette.none or "#11121d", fg = "#a9b1d6" },
  FloatBorder = { bg = colors.transparent and colors.palette.none or "#11121d", fg = border },
}

if colors.transparent then
  custom_highlights.TabLineFill = { bg = colors.palette.none }
  custom_highlights.TabLine = { bg = colors.palette.none }
  custom_highlights.TabLineSel = { bg = colors.palette.none }
  custom_highlights.PackListNormal = { bg = colors.palette.none }
  custom_highlights.PackListBorder = { bg = colors.palette.none, fg = border }
end

require("tokyodark").setup({
  transparent_background = colors.transparent,
  custom_palette = colors.custom_palette,
  custom_highlights = custom_highlights,
})
