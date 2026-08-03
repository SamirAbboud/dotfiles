local api = vim.api
local default_laststatus = vim.o.laststatus

local function update_statusline()
  local ft = vim.bo.filetype

  if ft == "alpha" or ft == "NvimTree" then
    vim.o.laststatus = 0
  else
    vim.o.laststatus = default_laststatus
  end
end

-- Don't auto-comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Toggle the statusline based on the current buffer
api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  callback = update_statusline,
})
