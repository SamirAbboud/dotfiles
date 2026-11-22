vim.filetype.add({
  extension = {
    ejs = "ejs",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "ejs",
    "liquid",
    "blade",
    "twig",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "json",
    "jsonc",
    "yaml",
    "lua",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

