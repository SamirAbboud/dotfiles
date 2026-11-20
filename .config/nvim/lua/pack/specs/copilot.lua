local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<A-CR>",
      accept_word = "<A-w>",
      dismiss = "<A-e>",
      next = "<A-]>",
      prev = "<A-[>",
    },
  },
  filetypes = {
    ["*"] = true,
  },
})

