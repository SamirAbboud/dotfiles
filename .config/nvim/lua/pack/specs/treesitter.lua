local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

local parsers = {
  "angular", "bash", "blade", "c", "caddy", "cmake", "cpp", "css", "csv",
  "dart", "dockerfile", "fish", "go", "gomod", "gosum", "gowork", "html", "java",
  "javadoc", "javascript", "json", "kitty", "kotlin", "latex", "liquid", "lua",
  "luadoc", "luap", "markdown", "markdown_inline", "php", "proto", "python", "query",
  "rasi", "regex", "rust", "scss", "svelte", "swift", "terraform", "toml",
  "tsx", "typescript", "vim", "vimdoc", "vue", "yaml", "zig",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
