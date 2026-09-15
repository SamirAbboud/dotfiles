local ok, supermaven = pcall(require, "supermaven-nvim")
if not ok then return end

supermaven.setup({
  keymaps = {
    accept_suggestion = "<A-CR>",
    clear_suggestion = "<A-e>",
    accept_word = "<A-w>",
  },
  ignore_filetypes = {},
  color = {
    suggestion_color = "#808080",
    cterm = 244,
  },
  disable_inline_completion = false,
})
