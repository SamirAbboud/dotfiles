return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git", ".bashrc" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
      shellcheckPath = "shellcheck",
    },
  },
}
