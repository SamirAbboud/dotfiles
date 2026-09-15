return {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  settings = {
    zls = {
      enable_autofix = true,
      enable_snippets = true,
      warn_style = true,
    },
  },
}
