local transparent = true

return {
  "sainnhe/everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = transparent and 2 or 0
  end,
}
