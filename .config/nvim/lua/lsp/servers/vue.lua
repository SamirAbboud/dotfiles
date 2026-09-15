return {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "package.json", "vue.config.js", "vite.config.ts", ".git" },
  init_options = {
    typescript = {
      -- Resolves global TS installation path automatically via Nix environment
      tsdk = "",
    },
  },
}
