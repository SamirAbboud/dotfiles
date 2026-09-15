local colors = require("config.colors")

require("tokyonight").setup({
  style = "night",
  transparent = colors.transparent,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = colors.transparent and "transparent" or "dark",
    floats = colors.transparent and "transparent" or "dark",
  },
  on_colors = function(c)
    c.border = c.fg_gutter
  end,
  on_highlights = function(hl, c)
    -- Disable fading/dimming on unused variables and functions
    hl.DiagnosticUnnecessary = {}

    hl["@keyword"] = { fg = "#f7768e" }
    hl["@keyword.function"] = { fg = "#f7768e" }
    hl["@keyword.return"] = { fg = "#f7768e", italic = true }
    hl["@keyword.conditional"] = { fg = "#7aa2f7" }
    hl["@function.builtin"] = { fg = "#c678dd" }
    hl["@function"] = { fg = "#c678dd" }
    hl["@string"] = { fg = "#9ece6a" }
    hl["@number"] = { fg = "#f7768e" }
    hl["@boolean"] = { fg = "#f7768e" }
    hl["@variable"] = { fg = "#c5cdd9" }
    hl["@variable.member"] = { fg = "#c5cdd9" }
    hl["@property"] = { fg = "#e5c07b" }
    hl["@comment"] = { fg = "#5c6370", italic = true }
    hl["@operator"] = { fg = "#7aa2f7" }

    -- HTML & Blade Treesitter Overrides
    hl["@tag"] = { fg = "#f7768e" }
    hl["@tag.builtin"] = { fg = "#f7768e" }
    hl["@tag.attribute"] = { fg = "#e5c07b" }
    hl["@tag.delimiter"] = { fg = "#f7768e" }
    hl["@markup.raw"] = { fg = "#abb2bf" }
    hl["@none"] = { fg = "#abb2bf" }
    hl["@markup.heading"] = { fg = "#abb2bf" }

    -- PHP / TREESITTER HIGHLIGHTS
    hl["@keyword.php"] = { fg = "#c678dd" }
    hl["@keyword.function"] = { fg = "#c678dd" }
    hl["@keyword.return"] = { fg = "#c678dd" }
    hl["@keyword.import.php"] = { fg = "#c678dd" }
    hl["@keyword.directive.php"] = { fg = "#c678dd" }
    hl["@keyword.type.php"] = { fg = "#c678dd" }
    hl["@keyword.modifier.php"] = { fg = "#c678dd" }
    hl["@function.php"] = { fg = "#7aa2f7" }
    hl["@function.method.php"] = { fg = "#7aa2f7" }
    hl["@function.call.php"] = { fg = "#7aa2f7" }
    hl["@function.method.call.php"] = { fg = "#7aa2f7" }
    hl["@variable.php"] = { fg = "#abb2bf" }
    hl["@variable.member.php"] = { fg = "#41a6b5" }
    hl["@variable.builtin.php"] = { fg = "#f7768e" }
    hl["@variable.parameter.php"] = { fg = "#f7768e" }
    hl["@property.php"] = { fg = "#41a6b5" }
    hl["@type.php"] = { fg = "#e5c07b" }
    hl["@type.builtin.php"] = { fg = "#ff9e64" }
    hl["@module.php"] = { fg = "#e5c07b" }
    hl["@string.php"] = { fg = "#9ece6a" }
    hl["@number.php"] = { fg = "#ff9e64" }
    hl["@operator.php"] = { fg = "#7f848e" }
    hl["@punctuation.special.php"] = { fg = "#7f848e" }
    hl["@punctuation.bracket.php"] = { fg = "#7f848e" }
    hl["@punctuation.delimiter.php"] = { fg = "#7f848e" }
    hl["@constructor.php"] = { fg = "#c678dd" }

    --
    hl.IblIndent = { fg = "#3e4451" }
    hl.IblScope = { fg = "#c678dd" }

    -- Package Manager Floating Window Highlights
    hl.PackListBorder = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.border }
    hl.PackListTitle = { bg = colors.palette.bg2, fg = c.blue, bold = true }

    -- nvim-cmp Floating Menu Highlights (Matches Telescope / PackList style)
    hl.Pmenu = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.fg }
    hl.PmenuSel = { bg = c.bg_highlight, fg = c.magenta, bold = true }
    hl.CmpBorder = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.border }
    hl.CmpDocBorder = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.border }

    -- LSP Hover Floating Window Highlights (Shift + K)
    hl.NormalFloat = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.fg }
    hl.FloatBorder = { bg = colors.transparent and colors.palette.none or c.bg_float, fg = c.border }

    if not colors.transparent then return end
    hl.TelescopeNormal = { bg = colors.palette.none }
    hl.TelescopeBorder = { bg = colors.palette.none, fg = c.border }
    hl.TelescopePromptBorder = { bg = colors.palette.none, fg = c.border }
    hl.TelescopeResultsTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopePreviewTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopePromptTitle = { bg = colors.palette.bg2, fg = c.blue }
    hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.magenta }
    hl.TelescopeSelectionCaret = { bg = c.bg_highlight, fg = c.magenta }
    hl.TelescopePromptPrefix = { fg = c.orange }
  end,
})
