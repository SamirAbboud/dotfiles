return {
  -- Core Dependencies & UI
  { repo = "nvim-lua/plenary.nvim" },
  { repo = "nvim-tree/nvim-web-devicons" },
  { repo = "nvim-lualine/lualine.nvim", spec = "pack.specs.lualine" },

  -- Telescope & Extensions
  { repo = "nvim-telescope/telescope.nvim", spec = "pack.specs.telescope" },

  -- Syntax Highlighting
  { repo = "nvim-treesitter/nvim-treesitter", spec = "pack.specs.treesitter" },

  -- Core Utilities
  { repo = "rmagatti/auto-session" },
  { repo = "windwp/nvim-autopairs" },
  { repo = "windwp/nvim-ts-autotag" },
  { repo = "tpope/vim-commentary" },
  { repo = "sickill/vim-pasta" },
  { repo = "NvChad/nvim-colorizer.lua" },
  { repo = "stevearc/dressing.nvim" },
  { repo = "lukas-reineke/indent-blankline.nvim" },
  { repo = "MeanderingProgrammer/render-markdown.nvim" },


  -- Autocompletion Stack
  { repo = "hrsh7th/cmp-nvim-lsp" },
  { repo = "hrsh7th/cmp-buffer" },
  { repo = "hrsh7th/cmp-path" },
  { repo = "L3MON4D3/LuaSnip" },
  { repo = "saadparwaiz1/cmp_luasnip" },
  { repo = "hrsh7th/nvim-cmp", spec = "pack.specs.cmp" },

  -- Formatting
  { repo = "stevearc/conform.nvim", spec = "pack.specs.conform" },

  -- Diagnostics & Quickfix
  { repo = "folke/trouble.nvim", spec = "pack.specs.trouble" },

  -- File Explorer (Disabled)
  { repo = "nvim-tree/nvim-tree.lua", spec = "pack.specs.nvimtree", disabled = true },

  -- XML/HTML Attribute Text Objects (Disabled)
  { repo = "kana/vim-textobj-user", disabled = true },
  { repo = "whatyouhide/vim-textobj-xmlattr", disabled = true },

  -- AI code completion (ghost text)
  { repo = "supermaven-inc/supermaven-nvim", spec = "pack.specs.supermaven" },

  -- Theme Repositories
  { repo = "tiagovla/tokyodark.nvim" },
  { repo = "folke/tokyonight.nvim" },
  { repo = "catppuccin/nvim", name = "catppuccin" },
  { repo = "neanias/everforest" },
  { repo = "ellisonleao/gruvbox.nvim" },
  { repo = "shaunsingh/nord.nvim" },
  { repo = "navarasu/onedark.nvim" },
}
