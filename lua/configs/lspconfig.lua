-- Импортируем конфигурации для lspconfig из nvchad
local configs = require "nvchad.configs.lspconfig"

-- Определяем функции on_attach, on_init и возможности клиента для использования в настройке LSP-серверов
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- Импортируем lspconfig, чтобы настраивать различные LSP-серверы
local lspconfig = require "lspconfig"

-- Если требуется стандартная конфигурация для серверов, добавляем их в таблицу servers
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "gopls",
  "gradle_ls",
  "terraformls",
  "ansiblels",
  "helm_ls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "bashls",
  "nginx_language_server",
}

-- Функция для организации импортов в TypeScript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- Настраиваем каждый сервер из списка servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,       -- Привязываем стандартные действия при подключении сервера
    capabilities = capabilities, -- Задаем возможности для клиента
    commands = {
      -- Добавляем команду OrganizeImports для TypeScript, чтобы организовывать импорты
      OrganizeImports = {
        organize_imports,
        description = "Организовать импорты",
      },
    },
    settings = {
      -- Настройки для Go-сервера (gopls)
      gopls = {
        completeUnimported = true, -- Автодополнение для неимпортированных пакетов
        usePlaceholders = true,    -- Использовать заполнители для аргументов
        analyses = {
          unusedparams = true,     -- Включить анализ на неиспользуемые параметры
        },
      },
    },
  }

  -- Отдельная настройка для сервера Prisma LSP
  lspconfig.prismals.setup {}

  -- Настройка сервера Volar для работы с Vue и TypeScript файлами
  lspconfig.volar.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
      vue = {
        hybridMode = false, -- Отключаем гибридный режим для Volar
      },
    },
  }

  -- Настройка сервера Ansible LSP
  lspconfig.ansiblels.setup {
    on_attach = on_attach,       -- Ваша функция on_attach
    filetypes = { "ansible" },
    capabilities = capabilities, -- Ваши возможности
    settings = {
      ansible = {
        path = "ansible", -- При необходимости отрегулируйте путь
        lint = true,
      },
    },
  }

  -- Настройка сервера Helm LSP
  lspconfig.helm_ls.setup {
    settings = {
      ['helm-ls'] = {
        yamlls = {
          path = "yaml-language-server",
        }
      }
    }
  }

  -- Настройка сервера YAML LSP
  lspconfig.yamlls.setup {}

  -- Настройка сервера Docker LSP
  lspconfig.dockerls.setup {}

  -- Настройка сервера Docker Compose LSP
  lspconfig.docker_compose_language_service.setup {
    on_attach = on_attach,
    -- cmd = { 'docker-compose-langserver', '--stdio' },
    filetypes = { 'yaml.docker-compose' },
    single_file_support = true,
  }

  -- Настройка сервера Bash LSP
  lspconfig.bashls.setup {
    on_attach = on_attach,
    filetypes = { "sh", "zsh", "bash" },
    cmd = { "bash-language-server", "start" },
    settings = {
      bashIde = {
        diagnostics = {
          enable = true,
        },
      },
    },
  }

  lspconfig.nginx_language_server.setup {
    on_attach = on_attach,
    filetypes = { "nginx" },
    cmd = { "nginx-language-server" },
    settings = {
      nginxIde = {
        diagnostics = {
          enable = true,
        },
      },
    },
  }


  -- Настройка сервера Terraform LSP
  -- lspconfig.terraformls.setup {}
end
