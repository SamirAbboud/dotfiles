local transparent = true
local border = "#5c6370"

local highlights = {
  TelescopePromptBorder = {
    fg = border,
  },
  TelescopeResultsBorder = {
    fg = border,
  },
  TelescopePreviewBorder = {
    fg = border,
  },
  TelescopeSelectionCaret = {
    bg = "#3b3f4c",
    fg = "#d19a66",
  },
}

if transparent then
  highlights.TabLineFill = {
    bg = "NONE",
  }

  highlights.TabLine = {
    bg = "NONE",
  }

  highlights.TabLineSel = {
    bg = "NONE",
  }
end

return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      transparent = transparent,
      highlights = highlights,
    })
  end,
}
