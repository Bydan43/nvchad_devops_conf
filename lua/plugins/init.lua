return {
  -- Плагин для автоматического форматирования файлов перед сохранением
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  -- Плагин для навигации между окнами в Tmux и сплитами в Neovim
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  -- Плагин для улучшения интерфейса в некоторых окнах Neovim
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  -- Конфигурация для языковых серверов (LSP)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Плагин для запуска и отображения тестов
  { "nvim-neotest/nvim-nio" },

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
      },
    },
  },

  -- Плагин для добавления линтинга
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  -- Автоматическое завершение HTML и XML тегов
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Плагин для легкого выхода из режима вставки (insert mode)
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Плагин для работы с тестами (с поддержкой адаптеров, например, neotest-jest)
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },

  -- Плагины для отладки (DAP - Debug Adapter Protocol)
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  -- UI для отладчика DAP
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  -- Улучшенная настройка для разработки с использованием Neovim Lua API
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },

  -- Поддержка работы с Git
  { "tpope/vim-fugitive" },
  -- Интерфейс для истории коммитов Git
  { "rbong/vim-flog",         dependencies = { "tpope/vim-fugitive" }, lazy = false },
  -- Интерфейс для просмотра различий в файлах
  { "sindrets/diffview.nvim", lazy = false },
  -- Быстрый поиск и перемещение по тексту
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
  -- Расширенный интерфейс для работы с quickfix
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  -- Плагин для отображения списка диагностик, быстрых исправлений и задач
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- Подсветка комментариев `TODO`, `FIXME` и других
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Поддержка автодополнения с использованием Codeium
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  -- Поддержка Ansible
  {
    "mfussenegger/nvim-ansible",
    lazy = false,
  },
  -- Поддержка Helm
  {
    "towolf/vim-helm",
    lazy = false,
  },

  -- Плагин для отладки Python
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}', -- This will launch the current file
          pythonPath = function()
            return 'python'
          end,
        },
      }
    end,
  },

  -- Null-ls for Black, Ruff, MyPy
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Поддержка подсветки синтаксиса Terraform и автоматического форматирования
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_fmt_on_save = 1 -- Автоматическое форматирование при сохранении
      vim.g.terraform_align = 1       -- Включение выравнивания для HCL синтаксиса
    end,
  },
}
