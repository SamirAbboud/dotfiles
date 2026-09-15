local ok, conform = pcall(require, "conform")
if not ok then
  return
end

conform.setup({
  formatters_by_ft = {
    -- Languages
    go = { "goimports", "gofmt" }, -- Go
    lua = { "stylua" }, -- Lua
    python = { "autoflake", "isort", "black" }, -- Python
    php = { "pint" }, -- PHP
    rust = { "rustfmt" }, -- Rust
    zig = { "zigfmt" }, -- Zig
    c = { "clang-format" }, -- C
    cpp = { "clang-format" }, -- C++

    -- HTML, CSS, JSON Formatters
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },

    -- JS / TS / React / Vue
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    vue = { "prettierd", "prettier", stop_after_first = true },

    -- Template Engines
    blade = { "blade-formatter" },
    liquid = { "prettierd", "prettier", stop_after_first = true },
    twig = { "prettierd", "prettier", stop_after_first = true },

    -- YAML and Markdown
    yaml = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },

    -- System tools
    sh = { "shfmt" },
    bash = { "shfmt" },
    fish = { "fish_indent" },
    nix = { "alejandra", "nixfmt", stop_after_first = true },
  },
  -- Default formatting options applied when conform.format() is called
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {
    shfmt = {
      -- Customize shfmt flags: -i 2 (indent 2 spaces), -ci (switch case indent), -sr (space after redirect)
      prepend_args = { "-i", "2", "-ci", "-sr" },
    },
  },
  -- Disable automatic formatting on save
  -- format_on_save = {
  --   timeout_ms = 1000,
  -- },
})

-- Keymap for manual formatting with notification feedback
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({
    async = true,
    lsp_format = "fallback",
  }, function(err)
    if err then
      vim.notify("Formatting failed: " .. tostring(err), vim.log.levels.WARN, { title = "Conform" })
    else
      local active_formatters = conform.list_formatters(0)
      local used_names = {}
      for _, f in ipairs(active_formatters) do
        if f.available then
          table.insert(used_names, f.name)
        end
      end

      local used = #used_names > 0 and table.concat(used_names, ", ") or "LSP"
      vim.notify("Formatted buffer with " .. used, vim.log.levels.INFO, { title = "Conform" })
    end
  end)
end, { desc = "Format buffer or visual range (Conform)" })
