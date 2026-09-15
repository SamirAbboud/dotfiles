# Modular Neovim Configuration

Custom, modular Neovim configuration built with Lua, featuring a manual package manager setup and custom LSP integrations.

## Directory Structure

```text
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── colors.lua        # Theme & highlight configurations
│   │   ├── keymaps.lua       # Keybindings & custom shortcuts
│   │   └── options.lua       # Vim options & system settings
│   ├── lsp/
│   │   ├── init.lua          # LSP client initialization & handler setup
│   │   └── servers/          # Individual language server configurations
│   ├── pack/
│   │   ├── init.lua          # Package manager core setup
│   │   ├── plugins.lua       # Main plugin list declarations
│   │   └── specs/            # Modular plugin spec overrides
│   └── utils/
│       └── terminal.lua      # Terminal toggle & buffer helper functions
└── snippets/
    ├── blade.json            # Blade template snippets
    ├── html.json             # HTML snippets
    ├── php.json              # PHP snippets
    └── package.json          # Snippets manifest & metadata
```


## Keybindings Reference

> **Leader Key:** `SPACE`

### General & Core Options

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<C-n>` | Normal | Open netrw file explorer |
| `<Esc>` | Normal | Clear search highlights |
| `<C-s>` | Normal | Save file (`write`) |
| `<C-q>` | Normal | Quit Neovim |
| `<Leader>x` | Normal | Open current file externally (`xdg-open`) |
| `q:` | Normal | Disable command-line window (mapped to `:q`) |
| `<C-z>` | Normal, Insert, Visual | Exit insert mode and undo |
| `<Leader>ut` | Normal | Cycle themes |
| `<Leader>ub` | Normal | Toggle background transparency |

### Navigation & Text Movement

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `j` / `k` | Normal | Move down / up (handles wrapped lines) |
| `<C-d>` / `<C-u>` | Normal | Scroll down / up and center cursor |
| `n` / `N` | Normal | Next / Previous search result (centered) |
| `<A-j>` / `<A-k>` | Insert, Normal | Move current line down / up |
| `<A-j>` / `<A-k>` | Visual | Move selected block down / up |

### Editing & Registers

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<` / `>` | Visual | Indent left / right (retains selection) |
| `y` / `Y` | Visual | Yank selection / line while preserving cursor position |
| `p` | Visual | Paste without overwriting default register |
| `x` | Normal | Delete character without yanking |
| `<Leader>d` | Normal, Visual | Delete without yanking |
| `<Leader>dd` | Normal | Delete line without yanking |
| `;;` | Insert | Append trailing semicolon to line |
| `,,` | Insert | Append trailing comma to line |
| `<Leader>+` / `<Leader>-` | Normal | Increment / Decrement number under cursor |
| `gcap` | Normal | Toggle comment on current paragraph safely |

### Window & Split Management

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<Leader>sv` / `<Leader>sh` | Normal | Split window vertically / horizontally |
| `<Leader>se` | Normal | Equalize split window dimensions |
| `<Leader>sx` | Normal | Close current split window |
| `<C-Up>` / `<C-Down>` | Normal | Adjust window height (+2 / -2) |
| `<C-Left>` / `<C-Right>` | Normal | Adjust window width (-2 / +2) |
| `<C-h>` / `<C-j>` | Normal | Navigate focus to Left / Lower window |
| `<C-k>` / `<C-l>` | Normal | Navigate focus to Upper / Right window |

### Tabs & Buffers

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<Tab>` / `<S-Tab>` | Normal | Switch to Next / Previous buffer |
| `<C-i>` | Normal | Jump forward in jump list |
| `<Leader>bo` | Normal | Open new empty buffer |
| `<Leader>bx` | Normal | Force close current buffer (`bdelete!`) |
| `<Leader>to` / `<Leader>tx` | Normal | Create new tab / Close current tab |
| `<Leader>tn` / `<Leader>tp` | Normal | Navigate to Next / Previous tab |
| `<Leader>tf` | Normal | Open current buffer in a new tab |

### Folds

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `za` | Normal | Toggle fold under cursor |
| `zz` | Normal | Toggle fold recursively |
| `zc` | Normal | Collapse all folds (`zM`) |
| `zo` | Normal | Open all folds (`zR`) |

### LSP Intelligence & Formatting

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `gd` | Normal | Go to Definition |
| `gD` | Normal | Go to Declaration |
| `gi` | Normal | Go to Implementation |
| `gr` | Normal | Go to References |
| `K` | Normal | Hover documentation window |
| `<Leader>rn` | Normal | Rename symbol |
| `<Leader>ca` | Normal, Visual | Code Actions |
| `[d` / `]d` | Normal | Jump to Previous / Next Diagnostic |
| `<Leader>cf` | Normal, Visual | Format buffer or range (Conform) |

### Telescope & Search (`<Leader>f`)

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<C-p>` | Normal | Find files in project |
| `<C-m>` | Normal | Search recent files |
| `<Leader>fs` | Normal | Live grep string in workspace |
| `<Leader>fc` | Normal | Grep word under cursor |
| `<Leader>fk` | Normal | Search registered keymaps |
| `<Leader>fb` | Normal | Search open buffers |

### Diagnostics & Workspace Tools (Trouble, Sessions, Terminal, AI)

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `<Leader>xx` / `<Leader>xw` | Normal | Toggle workspace diagnostics panel |
| `<Leader>xd` | Normal | Toggle buffer-local diagnostics panel |
| `<Leader>xq` / `<Leader>xl` | Normal | Toggle Quickfix list / Location list |
| `<Leader>ws` / `<Leader>wr` | Normal | Save / Restore workspace session for `cwd` |
| `<Leader><Space>` | Normal, Terminal | Toggle Floating Terminal |
| `<Leader>tk` | Normal, Terminal | Kill & restart floating terminal instance |
| `<Leader>mt` | Normal | Toggle inline Markdown render |
| `<A-CR>` | Insert | Accept Supermaven AI suggestion |
| `<A-e>` | Insert | Clear Supermaven AI suggestion |
| `<A-w>` | Insert | Accept Supermaven AI word suggestion |

---

## User Commands Reference

| Command | Arguments | Description |
| :--- | :--- | :--- |
| `:PackClean` | None | Remove disabled or unused plugin directories |
| `:PackUpdate` | None | Execute git pull across all active plugins |
| `:PackList` | None | Display loaded plugins and status list |
| `:LspInfo` | None | Show active LSP clients for current buffer |
| `:Theme` | `[theme_name]` | Cycle or apply specific color theme |
| `:ToggleTransparency` | None | Toggle background transparency state |


---

## Prerequisites

Ensure the following tools are available in your environment for full LSP, formatting, and search functionality:

* **Neovim** (v0.10+ recommended)
* **Git** & **C Compiler** (`gcc` or `clang`) — Required for plugin compilation and Treesitter parser builds
* **Fuzzy Search:** `ripgrep` & `fd` — Required for Telescope live grep and fast file searching
* **Formatters & LSPs:** Installed and managed via system package managers or Nix Flakes (`rust-analyzer`, `lua-language-server`, `gopls`, `pyright`, `intelephense`, etc.)

---

## Related Repositories

* [**dotfiles**](https://github.com/SamirAbboud/dotfiles) — Full user environment, shell configurations, and scripts.
* [**nixos-config**](https://github.com/SamirAbboud/nixos-config) — Declarative NixOS system flakes and Home Manager setup.
