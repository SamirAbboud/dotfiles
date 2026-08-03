local transparent = true

return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_disable_background = transparent
  end,
}

-- return {
--   "AlexvZyl/nordic.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nordic").setup({
--       transparent = { bg = transparent, float = transparent },
--       on_highlight = function(hl, palette)
--         hl.TelescopePromptNormal = {
--           bg = "NONE",
--         }

--         hl.TelescopePromptBorder = {
--           bg = "NONE",
--           fg = palette.black0,
--         }

--         hl.TelescopePromptPrefix = {
--           bg = "NONE",
--           fg = palette.orange.base,
--         }

--         hl.TelescopeSelectionCaret = {
--           bg = palette.black0,
--           fg = palette.yellow.bright,
--         }

--         if transparent then
--           hl.TabLineFill = { bg = "NONE" }
--           hl.TabLine = { bg = "NONE" }
--           hl.TabLineSel = { bg = "NONE" }
--         end
--       end,
--     })
--   end,
-- }
