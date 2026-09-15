local M = {}

local state = {
  outer_win = -1,
  inner_win = -1,
  buf = -1,
}

local function get_win_opts()
  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.6)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor(vim.o.lines * 0.16)

  return {
    outer = {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    },
    inner = {
      relative = "editor",
      width = width - 4,
      height = height - 2,
      row = row + 1,
      col = col + 2,
      style = "minimal",
      border = "none",
    },
  }
end

function M.toggle()
  -- If window is open, hide both inner and outer frames
  if vim.api.nvim_win_is_valid(state.outer_win) then
    vim.api.nvim_win_hide(state.outer_win)
    if vim.api.nvim_win_is_valid(state.inner_win) then
      vim.api.nvim_win_hide(state.inner_win)
    end
    return
  end

  -- Create buffer if it doesn't exist
  if not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = vim.api.nvim_create_buf(false, true)
  end

  local opts = get_win_opts()

  -- 1. Create container window (outer border)
  local scratch_buf = vim.api.nvim_create_buf(false, true)
  state.outer_win = vim.api.nvim_open_win(scratch_buf, false, opts.outer)

  -- 2. Create inner padded window (holds actual terminal)
  state.inner_win = vim.api.nvim_open_win(state.buf, true, opts.inner)

  -- Launch terminal if buffer is fresh
  if vim.bo[state.buf].buftype ~= "terminal" then
    vim.cmd.term(vim.o.shell)
  end

  vim.cmd("startinsert")
end

-- Kill current terminal session and open a fresh shell instance
function M.kill()
  if vim.api.nvim_win_is_valid(state.inner_win) then
    vim.api.nvim_win_close(state.inner_win, true)
  end

  if vim.api.nvim_win_is_valid(state.outer_win) then
    vim.api.nvim_win_close(state.outer_win, true)
  end

  if vim.api.nvim_buf_is_valid(state.buf) then
    vim.api.nvim_buf_delete(state.buf, { force = true })
  end

  state.outer_win = -1
  state.inner_win = -1
  state.buf = -1

  M.toggle()
end

-- Keymaps
vim.keymap.set({ "n", "t" }, "<leader><space>", M.toggle, { desc = "Toggle Floating Terminal" })
vim.keymap.set({ "n", "t" }, "<leader>tk", M.kill, { desc = "Kill & Restart Terminal" })

-- Hide floating terminal on Esc in terminal mode
vim.keymap.set("t", "<Esc>", function()
  if vim.api.nvim_win_is_valid(state.outer_win) then
    vim.api.nvim_win_hide(state.outer_win)
    if vim.api.nvim_win_is_valid(state.inner_win) then
      vim.api.nvim_win_hide(state.inner_win)
    end
  end
end, { desc = "Hide Floating Terminal" })

return M
