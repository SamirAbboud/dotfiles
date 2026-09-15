local ok, telescope = pcall(require, "telescope")
if not ok then return end

local actions = require("telescope.actions")
local open_with_trouble = function(...)
  require("trouble.sources.telescope").open(...)
end

telescope.setup({
  defaults = {
    prompt_prefix = " ❯ ",
    selection_caret = "❯ ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-t>"] = open_with_trouble,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = {
      "^%.$",      -- Ignores exact "."
      "^%./$",     -- Ignores "./"
    },
  },
  pickers = {
    oldfiles = {
      only_cwd = true,
      cwd_only = true,
    },
  },
})

-- Keymaps (<leader>f prefix for search/find)
local map = vim.keymap.set
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<C-m>", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Grep string" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Search open buffers" })

