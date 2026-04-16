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

  -- Улучшенный интерфейс Telescope: рамки, заголовки, аккуратная компоновка
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require "telescope.actions"
      local cfg = require "nvchad.configs.telescope"

      cfg.defaults = vim.tbl_deep_extend("force", cfg.defaults or {}, {
        prompt_prefix = "   ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",

        layout_config = {
          prompt_position = "top",
          horizontal = {
            prompt_position = "top",
            preview_width = 0.58,
          },
          width = 0.95,
          height = 0.88,
          preview_cutoff = 100,
        },

        border = true,
        prompt_title = "Поиск",
        results_title = "Результаты",
        preview_title = "Предпросмотр",
        dynamic_preview_title = true,
        winblend = 0,
        path_display = { "truncate" },

        borderchars = {
          prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          },
        },
      })

      cfg.pickers = vim.tbl_deep_extend("force", cfg.pickers or {}, {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      })

      return cfg
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "themes")
      pcall(require("telescope").load_extension, "terms")
    end,
  },

}
