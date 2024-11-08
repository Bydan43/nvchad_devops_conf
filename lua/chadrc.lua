-- Этот файл должен иметь ту же структуру, что и nvconfig.lua
-- Документация и исходный файл можно найти по ссылке:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Настройки пользовательского интерфейса (UI)
M.ui = {
  theme = "decay",     -- Тема оформления для NvChad
  transparency = true, -- Включение прозрачности интерфейса

  statusline = {
    theme = "vscode_colored", -- Тема для статусной строки
  },

  hl_override = {
    -- Переопределение стилей для элементов интерфейса
    Comment = { italic = true },      -- Комментарии будут отображаться курсивом
    ["@comment"] = { italic = true }, -- Комментарии Treesitter также будут курсивом

    -- Настройки цветов для изменений в диффах (Diff)
    DiffChange = {
      bg = "#464414", -- Фон для измененных строк в диффе
      fg = "none",    -- Цвет текста отключен
    },
    DiffAdd = {
      bg = "#103507", -- Фон для добавленных строк
      fg = "none",    -- Цвет текста отключен
    },
    DiffRemoved = {
      bg = "#461414", -- Фон для удаленных строк
      fg = "none",    -- Цвет текста отключен
    },
  },
}

return M

