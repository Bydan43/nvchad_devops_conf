-- Плагин для подсветки синтаксиса и парсинга кода с использованием Treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "go",
        "hcl",
        "yaml",
        "dockerfile",
        "helm",
        "nginx",
        "python",
      },
    },
  },
}