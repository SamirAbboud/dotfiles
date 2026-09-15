local colors = require("config.colors")

vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = colors.transparent and 2 or 0

-- Apply custom float & cmp highlights when Everforest loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "everforest",
  callback = function()
    -- Evaluates to "NONE" string or actual color table value
    local bg = colors.transparent and "NONE" or (colors.palette and colors.palette.bg0 or "NONE")
    local border_fg = colors.palette and colors.palette.bg3 or "#5c6f7b"
    local sel_bg = colors.palette and colors.palette.bg1 or "#3a515d"

    -- PackList Highlights
    vim.api.nvim_set_hl(0, "PackListNormal", { bg = bg })
    vim.api.nvim_set_hl(0, "PackListBorder", { bg = bg, fg = border_fg })

    -- cmp Completion Menu Highlights
    vim.api.nvim_set_hl(0, "Pmenu", { bg = bg })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = sel_bg, bold = true })
    vim.api.nvim_set_hl(0, "CmpBorder", { bg = bg, fg = border_fg })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = bg, fg = border_fg })

    -- LSP Hover Floating Window Highlights (Shift + K)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg, fg = border_fg })
  end,
})
