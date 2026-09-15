local colors = require("config.colors")
local border = "#525252"

local overrides = {
  TelescopePromptBorder = { fg = border },
  TelescopeResultsBorder = { fg = border },
  TelescopePreviewBorder = { fg = border },
  TelescopeSelectionCaret = { bg = "#3c3836", fg = "#fb4934" },

  -- PackList Border & Title styling
  PackListBorder = { fg = border },
  PackListTitle = { bg = "#3c3836", fg = "#fe8019", bold = true },

  -- cmp Completion Menu Highlights
  Pmenu = { bg = colors.transparent and "NONE" or "#282828", fg = "#ebdbb2" },
  PmenuSel = { bg = "#3c3836", fg = "#fe8019", bold = true },
  CmpBorder = { bg = colors.transparent and "NONE" or "#282828", fg = border },
  CmpDocBorder = { bg = colors.transparent and "NONE" or "#282828", fg = border },

  -- LSP Hover Floating Window Highlights (Shift + K)
  NormalFloat = { bg = colors.transparent and "NONE" or "#282828", fg = "#ebdbb2" },
  FloatBorder = { bg = colors.transparent and "NONE" or "#282828", fg = border },
}

if colors.transparent then
  overrides.TabLineFill = { bg = "NONE" }
  overrides.TabLine = { bg = "NONE" }
  overrides.TabLineSel = { bg = "NONE" }
end

require("gruvbox").setup({
  contrast = "hard",
  transparent_mode = colors.transparent,
  overrides = overrides,
})
