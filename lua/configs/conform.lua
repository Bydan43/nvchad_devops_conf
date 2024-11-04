-- Определяем параметры для настройки Conform (инструмента для форматирования кода)
local options = {
  -- Указываем форматтеры для каждого типа файлов
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    hcl = { "hclfmt" },
    terraform = { "hclfmt" },
    bash = { "shfmt" },
  },

  -- Параметры для форматирования при сохранении
  format_on_save = {
    -- Эти параметры будут переданы функции conform.format()
    timeout_ms = 500,    -- Максимальное время ожидания завершения форматирования (в миллисекундах)
    lsp_fallback = true, -- Если форматтер не найден, использовать форматирование LSP
  },
}

-- Настраиваем Conform с заданными параметрами
require("conform").setup(options)
