-- Indentation and tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search settings
vim.opt.ignorecase = true               -- Ignore case in search patterns
vim.opt.smartcase = true                -- ...unless search contains uppercase letters
vim.opt.hlsearch = true                 -- Highlight search results
vim.opt.incsearch = true                -- Show matches while typing search

-- UI and Appearance
vim.opt.termguicolors = true            -- Enable 24-bit RGB true colors in the terminal
vim.opt.spell = false                   -- Disable built-in spell checking
vim.opt.signcolumn = "yes"              -- Always reserve space for signs (Git/LSP) to prevent layout shifts
vim.opt.cursorline = true               -- Highlight the screen line where the cursor is currently placed
vim.opt.scrolloff = 8                   -- Keep at least 8 lines visible above/below cursor when scrolling vertically
vim.opt.sidescrolloff = 8               -- Keep at least 8 columns visible left/right of cursor when scrolling horizontally
vim.opt.wrap = true                     -- Wrap long lines visually onto the next screen line
vim.opt.breakindent = true              -- Maintain the line's indentation level when long lines wrap
vim.opt.linebreak = true                -- Wrap long lines only at full word boundaries instead of mid-word
vim.opt.showmode = false                -- Hide the default mode text (-- INSERT --) since statusline handles it
vim.opt.virtualedit = "block"           -- Allow cursor to move into empty space in Visual Block mode
vim.opt.inccommand = "split"            -- Live split preview window for substitute operations (:s/old/new)
vim.opt.list = true                     -- Display invisible whitespace characters
vim.opt.fillchars:append({ eob = " " }) -- Clear tildes (~) at the end of buffers
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }


-- System & File Management
vim.opt.mouse = "a"                     -- Enable full mouse support across all modes
vim.opt.clipboard = "unnamedplus"       -- Sync Neovim register with the system clipboard
vim.opt.confirm = true                  -- Confirm before exiting or abandoning unsaved changes in a buffer
vim.opt.undofile = true                 -- Save persistent undo history to disk across sessions
vim.opt.swapfile = false                -- Disable swap files creation (.swp)
vim.opt.backup = false                  -- Disable creation of backup files
vim.opt.updatetime = 250                -- Faster UI updates & LSP diagnostics (default is 4000ms)
vim.opt.timeoutlen = 300                -- Time to wait for mapped key sequence to complete (ms)
vim.opt.shortmess:append({ I = true })  -- Hide the startup splash screen

-- Window Splits
vim.opt.splitright = true               -- Put new vertical splits to the right of the current window
vim.opt.splitbelow = true               -- Put new horizontal splits below the current window

-- netrw configuration
-- vim.g.netrw_banner = 0               -- Hide top banner help text
vim.g.netrw_liststyle = 3               -- Tree view display style
vim.g.netrw_browse_split = 0            -- Open files in the current window
vim.g.netrw_winsize = 25                -- Set window width when splitting

-- enable editor config
vim.g.editorconfig = true

-- Code Folding
vim.opt.foldlevel = 99        -- Keep all folds expanded when opening a file
vim.opt.foldlevelstart = 99   -- Start with expanded folds
vim.opt.foldenable = true     -- Enable folding engine

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  group = vim.api.nvim_create_augroup("TreesitterFolding", { clear = true }),
  callback = function()
    -- Check if Treesitter is attached to this buffer
    local ok, parser = pcall(vim.treesitter.get_parser)
    if ok and parser then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    else
      vim.wo.foldmethod = "indent" -- Fallback if Treesitter isn't running
    end
    vim.wo.foldlevel = 99
    vim.wo.foldenable = true
  end,
})

-- FOLD LOOK & FEEL (Clean foldtext representation)
function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return string.format("%s  (%d lines)", line, line_count)
end

vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.opt.fillchars:append({ fold = " " })
