return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "blade",
    "liquid",
    "twig",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.cjs",
    "postcss.config.js",
    "package.json",
    ".git",
  },
  settings = {
    tailwindCSS = {
      userLanguages = {
        blade = "html",
        twig = "html",
        liquid = "html",
      },
    },
  },
}
