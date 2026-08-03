--------------------------------------------------------------------------------
-- Leader
--------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlight",
  silent = true,
})

vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", {
  desc = "Save file",
  silent = true,
})

vim.keymap.set("n", "<C-q>", "<cmd>quit<CR>", {
  desc = "Quit",
  silent = true,
})

vim.keymap.set("n", "<leader>x", "<cmd>!xdg-open %<CR><CR>", {
  desc = "Open file externally",
  silent = true,
})

vim.keymap.set("n", "q:", ":q", {
  desc = "Disable command-line window",
})

--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move up (wrapped lines)",
})

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move down (wrapped lines)",
})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {
  desc = "Scroll down and center",
})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {
  desc = "Scroll up and center",
})

vim.keymap.set("n", "n", "nzzzv", {
  desc = "Next search result",
})

vim.keymap.set("n", "N", "Nzzzv", {
  desc = "Previous search result",
})

--------------------------------------------------------------------------------
-- Editing
--------------------------------------------------------------------------------

vim.keymap.set("v", "<", "<gv", {
  desc = "Indent left",
})

vim.keymap.set("v", ">", ">gv", {
  desc = "Indent right",
})

vim.keymap.set("v", "y", "myy`y", {
  desc = "Yank and keep cursor",
})

vim.keymap.set("v", "Y", "myY`y", {
  desc = "Yank line and keep cursor",
})

vim.keymap.set("v", "p", '"_dP', {
  desc = "Paste without overwriting register",
})

vim.keymap.set("n", "x", '"_x', {
  desc = "Delete character without yanking",
})

vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', {
  desc = "Delete without yanking",
})

vim.keymap.set("n", "<leader>dd", '"_dd', {
  desc = "Delete line without yanking",
})

vim.keymap.set("i", ";;", "<Esc>A;<Esc>", {
  desc = "Insert trailing semicolon",
})

vim.keymap.set("i", ",,", "<Esc>A,<Esc>", {
  desc = "Insert trailing comma",
})

--------------------------------------------------------------------------------
-- Numbers
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>+", "<C-a>", {
  desc = "Increment number",
})

vim.keymap.set("n", "<leader>-", "<C-x>", {
  desc = "Decrement number",
})

--------------------------------------------------------------------------------
-- Move Text
--------------------------------------------------------------------------------

vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi", {
  desc = "Move line down",
})

vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi", {
  desc = "Move line up",
})

vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", {
  desc = "Move line down",
})

vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", {
  desc = "Move line up",
})

vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", {
  desc = "Move selection down",
})

vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", {
  desc = "Move selection up",
})

--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>sv", "<C-w>v", {
  desc = "Split vertically",
})

vim.keymap.set("n", "<leader>sh", "<C-w>s", {
  desc = "Split horizontally",
})

vim.keymap.set("n", "<leader>se", "<C-w>=", {
  desc = "Equalize splits",
})

vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {
  desc = "Close split",
})

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", {
  desc = "Increase window height",
})

vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", {
  desc = "Decrease window height",
})

vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", {
  desc = "Decrease window width",
})

vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", {
  desc = "Increase window width",
})

vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Focus left window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Focus lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Focus upper window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Focus right window",
})

--------------------------------------------------------------------------------
-- Tabs
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {
  desc = "New tab",
})

vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {
  desc = "Close tab",
})

vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", {
  desc = "Next tab",
})

vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", {
  desc = "Previous tab",
})

vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {
  desc = "Current buffer in new tab",
})

--------------------------------------------------------------------------------
-- Buffers
--------------------------------------------------------------------------------

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {
  desc = "Next buffer",
})

vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<C-i>", "<C-i>", {
  desc = "Jump forward",
})

vim.keymap.set("n", "<leader>bx", "<cmd>Bdelete!<CR>", {
  desc = "Close buffer",
})

vim.keymap.set("n", "<leader>bo", "<cmd>enew<CR>", {
  desc = "New buffer",
})
