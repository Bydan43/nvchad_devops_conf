return {

  -- Плагин для автоматического форматирования файлов перед сохранением
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },


  -- Конфигурация для языковых серверов (LSP)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Плагин для установки и управления инструментами разработки
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "gopls",
        "js-debug-adapter",
        "typescript-language-server",
        "ansible-language-server",
        "terraform-ls",
        "nginx-language-server",
        "ansible-language-server",
        "bash-language-server",
        "docker-language-server",
        "docker-compose-language-service",
        "helm-ls",
        "yaml-language-server",
        "shfmt",
        "hclfmt",
        "ansible-lint",
        "hadolint",
        "black",
        "pyright"
      },
    },
  },

  -- Плагин для подсветки синтаксиса и парсинга кода с использованием Treesitter
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
