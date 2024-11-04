-- Плагин для автоматического форматирования файлов перед сохранением
return {

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
}