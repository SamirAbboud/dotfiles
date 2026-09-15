local colors = require("config.colors")
local border = "#5c6370"

local highlights = {
  -- Telescope
  TelescopePromptBorder = { fg = border },
  TelescopeResultsBorder = { fg = border },
  TelescopePreviewBorder = { fg = border },
  TelescopeSelectionCaret = { bg = "#3b3f4c", fg = "#d19a66" },

  -- Package Manager Floating Window
  PackListBorder = { fg = border },
  PackListTitle = { bg = "NONE", fg = "#e06c75", fmt = "bold" },

  -- cmp Completion Menu Highlights
  Pmenu = { bg = colors.transparent and "NONE" or "#21252b", fg = "#abb2bf" },
  PmenuSel = { bg = "#3b3f4c", fg = "#e5c07b", fmt = "bold" },
  CmpBorder = { bg = colors.transparent and "NONE" or "#21252b", fg = border },
  CmpDocBorder = { bg = colors.transparent and "NONE" or "#21252b", fg = border },

  -- LSP Hover Floating Window Highlights (Shift + K)
  NormalFloat = { bg = colors.transparent and "NONE" or "#21252b", fg = "#abb2bf" },
  FloatBorder = { bg = colors.transparent and "NONE" or "#21252b", fg = border },
}

if colors.transparent then
  highlights.TabLineFill = { bg = "NONE" }
  highlights.TabLine = { bg = "NONE" }
  highlights.TabLineSel = { bg = "NONE" }
  highlights.PackListNormal = { bg = "NONE" }
  highlights.PackListBorder = { bg = "NONE", fg = border }
end

require("onedark").setup({
  transparent = colors.transparent,
  highlights = highlights,
})
