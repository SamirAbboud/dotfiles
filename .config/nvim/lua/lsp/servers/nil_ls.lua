return {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", "configuration.nix", ".git" },
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixfmt" },
      },
      diagnostics = {
        ignored = {},
      },
    },
  },
}
