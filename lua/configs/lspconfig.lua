-- Импортируем конфигурации для lspconfig из nvchad
local configs = require "nvchad.configs.lspconfig"

-- Определяем функции on_attach, on_init и возможности клиента для использования в настройке LSP-серверов
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- Используем новый API vim.lsp.config вместо устаревшего require "lspconfig"

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
  "pyright",
}

-- Функция для организации импортов в TypeScript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- Настраиваем каждый сервер из списка servers с базовой конфигурацией
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,       -- Привязываем стандартные действия при подключении сервера
    capabilities = capabilities, -- Задаем возможности для клиента
  })
end

-- Отдельные настройки для серверов с особыми требованиями

-- Настройка сервера TypeScript с командой OrganizeImports
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    -- Добавляем команду OrganizeImports для TypeScript, чтобы организовывать импорты
    OrganizeImports = {
      organize_imports,
      description = "Организовать импорты",
    },
  },
})

-- Настройка сервера Go с дополнительными настройками
vim.lsp.config('gopls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true, -- Автодополнение для неимпортированных пакетов
      usePlaceholders = true,    -- Использовать заполнители для аргументов
      analyses = {
        unusedparams = true,     -- Включить анализ на неиспользуемые параметры
      },
    },
  },
})

-- Настройка сервера Prisma LSP
vim.lsp.config('prismals', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Настройка сервера Volar для работы с Vue и TypeScript файлами
vim.lsp.config('volar', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      hybridMode = false, -- Отключаем гибридный режим для Volar
    },
  },
})

-- Настройка сервера Ansible LSP
vim.lsp.config('ansiblels', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "ansible" },
  settings = {
    ansible = {
      path = "ansible", -- При необходимости отрегулируйте путь
      lint = true,
    },
  },
})

-- Настройка сервера Helm LSP
vim.lsp.config('helm_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
})

-- Настройка сервера YAML LSP
vim.lsp.config('yamlls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Настройка сервера Docker LSP
vim.lsp.config('dockerls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Настройка сервера Docker Compose LSP
vim.lsp.config('docker_compose_language_service', {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { 'docker-compose-langserver', '--stdio' },
  filetypes = { 'yaml.docker-compose' },
  single_file_support = true,
})

-- Настройка сервера Bash LSP
vim.lsp.config('bashls', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh", "zsh", "bash" },
  cmd = { "bash-language-server", "start" },
  settings = {
    bashIde = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- Настройка сервера Nginx LSP
vim.lsp.config('nginx_language_server', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "nginx" },
  cmd = { "nginx-language-server" },
  settings = {
    nginxIde = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- Настройка сервера Pyright
vim.lsp.config('pyright', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Настройка сервера Terraform LSP
-- vim.lsp.config('terraformls', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
