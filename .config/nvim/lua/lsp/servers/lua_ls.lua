return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { "vim" },
        -- Disable duplicate warnings handled by luacheck
        disable = { "unused-local", "unused-function", "unused-var" },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      format = {
        enable = false, -- -- Handled by Conform (stylua)
      },
    },
  },
}
