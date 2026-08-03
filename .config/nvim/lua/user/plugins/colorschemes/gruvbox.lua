local transparent = true
local border = "#525252"

local overrides = {
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
    bg = "#3c3836",
    fg = "#fb4934",
  },
}

if transparent then
  overrides.TabLineFill = {
    bg = "NONE",
  }

  overrides.TabLine = {
    bg = "NONE",
  }

  overrides.TabLineSel = {
    bg = "NONE",
  }
end

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {
    contrast = "hard",
    transparent_mode = transparent,
    overrides = overrides,
  },
}
