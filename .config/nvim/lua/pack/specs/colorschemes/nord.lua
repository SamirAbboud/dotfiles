local colors = require("config.colors")

vim.g.nord_disable_background = colors.transparent

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nord",
  callback = function()
    local bg = colors.transparent and "NONE" or "#2e3440"
    local border_fg = colors.palette and colors.palette.bg3 or "#4c566a"
    local sel_bg = colors.palette and colors.palette.bg1 or "#3b4252"

    -- PackList Highlights
    vim.api.nvim_set_hl(0, "PackListNormal", { bg = bg })
    vim.api.nvim_set_hl(0, "PackListBorder", { bg = bg, fg = border_fg })

    -- cmp Completion Menu Highlights
    vim.api.nvim_set_hl(0, "Pmenu", { bg = bg, fg = "#d8dee9" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = sel_bg, fg = "#88c0d0", bold = true })
    vim.api.nvim_set_hl(0, "CmpBorder", { bg = bg, fg = border_fg })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = bg, fg = border_fg })

    -- LSP Hover Floating Window Highlights (Shift + K)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg, fg = "#d8dee9" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg, fg = border_fg })
  end,
})

-- Alternative: Nordic
-- require("nordic").setup({
--   transparent = { bg = colors.transparent, float = colors.transparent },
--   on_highlight = function(hl, palette)
--     hl.TelescopePromptNormal = { bg = "NONE" }
--     hl.TelescopePromptBorder = { bg = "NONE", fg = palette.black0 }
--     hl.TelescopePromptPrefix = { bg = "NONE", fg = palette.orange.base }
--     hl.TelescopeSelectionCaret = { bg = palette.black0, fg = palette.yellow.bright }
--     if colors.transparent then
--       hl.TabLineFill = { bg = "NONE" }
--       hl.TabLine = { bg = "NONE" }
--       hl.TabLineSel = { bg = "NONE" }
--     end
--   end,
-- })
