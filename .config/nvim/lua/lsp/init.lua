local M = {}

-- Diagnostic Appearance
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    },
  },
  underline = false,
  severity_sort = true,
  float = {
    border = "rounded",
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
  },
})

-- Show active LSP clients for current buffer
local function show_lsp_info()
  local buf = vim.api.nvim_get_current_buf()
  local buf_name = vim.fs.basename(vim.api.nvim_buf_get_name(buf))
  local filetype = vim.bo[buf].filetype
  local clients = vim.lsp.get_clients({ bufnr = buf })

  if #clients == 0 then
    print(string.format("No active LSP clients for '%s' (%s)", buf_name ~= "" and buf_name or "Untitled", filetype))
    return
  end

  local output = {
    "--------------------------------------------------",
    string.format("  LSP Status: %s [%s]", buf_name ~= "" and buf_name or "Untitled", filetype),
    "--------------------------------------------------",
  }

  for _, client in ipairs(clients) do
    table.insert(output, string.format("  • %s (ID: %d)", client.name, client.id))
  end

  table.insert(output, "--------------------------------------------------")

  vim.cmd("redraw")
  print(table.concat(output, "\n"))
end

-- Shared Keymaps on LSP attach
local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = "LSP: " .. desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "gr", vim.lsp.buf.references, "Go to References")

  map("n", "K", function()
    vim.lsp.buf.hover({
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    })
  end, "Hover Documentation")

  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, "Previous Diagnostic")
  map("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, "Next Diagnostic")
end

-- Track warned servers during the current session to avoid duplicate spam
local warned_servers = {}

-- Dynamically load all server configs from lua/lsp/servers/
local function get_servers()
  local servers = {}
  local servers_dir = vim.fn.stdpath("config") .. "/lua/lsp/servers"
  local files = vim.fn.globpath(servers_dir, "*.lua", false, true)

  for _, file in ipairs(files) do
    local server_name = vim.fn.fnamemodify(file, ":t:r")
    local ok, config = pcall(require, "lsp.servers." .. server_name)
    if ok and type(config) == "table" then
      servers[server_name] = config
    end
  end

  return servers
end

-- Helper to get capabilities
local function get_capabilities()
  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    return cmp_lsp.default_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end



function M.setup()
  local servers = get_servers()

  -- Register user command for lsp INFO
  vim.api.nvim_create_user_command("LspInfo", show_lsp_info, {
    desc = "Show active LSP clients for current buffer"
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      for name, config in pairs(servers) do
        if config.filetypes and vim.tbl_contains(config.filetypes, ft) then
          local binary = config.cmd and config.cmd[1]

          -- 1. Validate executable existence on system $PATH
          if binary and vim.fn.executable(binary) == 1 then
            local root_dir = vim.fs.root(args.buf, config.root_markers or { ".git" })
            vim.lsp.start({
              name = name,
              cmd = config.cmd,
              root_dir = root_dir,
              settings = config.settings,
              capabilities = get_capabilities(),
              on_attach = on_attach,
            })
          else
            -- 2. Display a descriptive warning instead of throwing an unhandled LSP error
            if not warned_servers[name] then
              warned_servers[name] = true
              vim.notify(
                string.format(
                  "LSP Server '%s' could not start.\n\nExecutable '%s' was not found on your system PATH.\n"
                    .. "To enable language intelligence for %s files, install it via Nix or nix-shell:\n\n"
                    .. "  nix-shell -p %s",
                  name,
                  binary or "unknown",
                  ft,
                  name == "lua_ls" and "lua-language-server" or name
                ),
                vim.log.levels.WARN,
                { title = "LSP Binary Missing" }
              )
            end
          end
        end
      end
    end,
  })
end

return M
