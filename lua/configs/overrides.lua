local M = {}

-- Конфигурация для Treesitter
M.treesitter = {
  ensure_installed = {
    -- Список языков, для которых Treesitter должен быть установлен
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "prisma",
    "vue",
    "go",
    "terraform",
  },
  indent = {
    enable = true, -- Включение автоматического выравнивания кода с помощью Treesitter
  },
}

-- Конфигурация для Mason (менеджер пакетов LSP и утилит)
M.mason = {
  ensure_installed = {
    -- Список серверов и утилит, которые Mason должен установить
    "lua-language-server",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint_d",
    "clangd",
    "clang-format",
    "node-debug2-adapter",
    "gopls",
    "gradle_ls",
    "terraform-ls",
    "nginx-language-server",
    "ansible-language-server",
    "bash-language-server",
    "docker-language-server",
    "docker-compose-language-service",
    "helm-ls",
    "yaml-language-server",
  },
}

-- Конфигурация для nvimtree (файловый проводник)
M.nvimtree = {
  git = {
    enable = true, -- Включить поддержку Git в nvimtree
  },

  renderer = {
    highlight_git = true, -- Подсвечивать изменения Git в nvimtree
    icons = {
      show = {
        git = true, -- Показать иконки Git в nvimtree
      },
    },
  },
}

return M
