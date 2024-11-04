-- Устанавливаем линтеры по типу файлов
require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  ansible = { "ansible-lint" },
  docker = { "hadolint" },
}

-- Автоматически запускать линтер при сохранении файла
vim.api.nvim_create_autocmd({ "BufWritePost" }, { -- Событие срабатывает после записи буфера
  callback = function()
    require("lint").try_lint()                    -- Запуск функции линтинга для текущего буфера
  end,
})
