-- Устанавливаем путь для кеша base46 (тема оформления и настройки интерфейса)
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

-- Определяем пробел в качестве клавиши лидера (для пользовательских сочетаний клавиш)
vim.g.mapleader = " "

-- Подготовка к загрузке lazy.nvim и всех плагинов
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Проверяем, установлен ли lazy.nvim; если нет, клонируем его из репозитория
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"                                     -- URL репозитория
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath } -- Клонируем только необходимые файлы
end

-- Добавляем путь lazy.nvim в путь runtimepath для загрузки плагина
vim.opt.rtp:prepend(lazypath)

-- Импортируем настройки для lazy.nvim из файла configs.lazy
local lazy_config = require "configs.lazy"

-- Загружаем плагины с использованием lazy.nvim
require("lazy").setup({
  {
    "NvChad/NvChad",           -- Основной плагин NvChad для настройки интерфейса
    lazy = false,              -- Загрузка без отложенной инициализации
    branch = "v2.5",           -- Используемая ветка NvChad
    import = "nvchad.plugins", -- Импортируем плагины NvChad
  },
  { import = "plugins" },      -- Импортируем пользовательские плагины
}, lazy_config)

-- Загружаем тему оформления и параметры statusline (строки состояния) из кеша base46
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Импортируем основные настройки
require "options"
require "nvchad.autocmds" -- Загрузить автокоманды из nvchad

-- Откладываем загрузку пользовательских сочетаний клавиш
vim.schedule(function()
  require "mappings" -- Загружаем файл с пользовательскими сочетаниями клавиш
end)

