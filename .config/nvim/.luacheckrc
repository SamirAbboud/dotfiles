---@diagnostic disable: lowercase-global

std = "lua54"

-- Luacheck configuration for Neovim
globals = {
  "vim", -- Neovim global
}

-- Ignore line length warnings
max_line_length = false

-- Ignore unused arguments warnings for common patterns
ignore = {
    "631", -- Line too long
    "212", -- Unused argument
    "213", -- Unused loop variable
    "122", -- Setting read-only field (false positive for vim.opt and vim.g)
}

-- Don't report unused self arguments of methods
self = false
