-- =============================================================================
-- AUTO SESSION (Session Management)
-- =============================================================================
local auto_session = require("auto-session")

auto_session.setup({
  auto_restore_enabled = false,
  suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
})

local map = vim.keymap.set
map("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
map("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for cwd" })

-- =============================================================================
-- AUTO PAIRS (Bracket & Quote Auto-completion)
-- =============================================================================
local autopairs = require("nvim-autopairs")

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

-- Attach to nvim-cmp safely when it's available
local ok, cmp = pcall(require, "cmp")
if ok then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- =============================================================================
-- TS AUTOTAG (Auto Close & Rename HTML/Template Tags)
-- =============================================================================
local ok_autotag, autotag = pcall(require, "nvim-ts-autotag")
if ok_autotag then
  autotag.setup({
    opts = {
      enable_close = true,          -- Auto-close tags when typing '>'
      enable_rename = true,         -- Auto-rename matching opening/closing tags
      enable_close_on_slash = true, -- Auto-close on typing '</'
    },
    filetypes = {
      "html",
      "xml",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "blade",
      "twig",
      "liquid",
    },
  })
end

-- =============================================================================
-- VIM COMMENTARY & VIM PASTA
-- =============================================================================
-- Maintain cursor position when commenting a paragraph
map("n", "gcap", "my<cmd>norm vip<bar>gc<cr>`y", { desc = "Comment paragraph safely" })

-- Disable automatic paste re-indentation in fugitive buffers
vim.g.pasta_disabled_filetypes = { "fugitive" }

-- =============================================================================
-- COLORIZER (Hex/RGB Color Highlights)
-- =============================================================================
local ok_colorizer, colorizer = pcall(require, "colorizer")
if ok_colorizer then
  colorizer.setup({
    user_default_options = {
      names = false, -- Disable color name matching like "blue" or "red"
      RRGGBB = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      mode = "background", -- "background", "foreground", or "virtualtext"
    },
  })
end

-- =============================================================================
-- DRESSING (Clean UI for vim.ui.select & vim.ui.input)
-- =============================================================================
local ok_dressing, dressing = pcall(require, "dressing")
if ok_dressing then
  dressing.setup()
end


-- =============================================================================
-- INDENT BLANKLINE (Visual Indent Guides)
-- =============================================================================
local ok_ibl, ibl = pcall(require, "ibl")
if ok_ibl then
  ibl.setup({
    indent = {
      char = "│", -- or "┊"
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  })
end

-- =============================================================================
-- RENDER MARKDOWN (In-Buffer Visual Formatting)
-- =============================================================================
local ok_render_md, render_md = pcall(require, "render-markdown")
if ok_render_md then
  render_md.setup({
    enabled = false,
    heading = {
      enabled = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      enabled = true,
      style = "full",
    },
  })

  vim.keymap.set("n", "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle buffer Markdown render" })
end

