-- Подсказки по клавишам: после <leader> появляется всплывающее окно с описаниями.
-- Тексты групп — на русском; у отдельных маппингов подписи задаются полем `desc` в mappings.lua.
return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      delay = function(ctx)
        return ctx.plugin and 0 or 120
      end,
      sort = { "local", "order", "group", "alphanum", "mod", "manual" },
      expand = 1,
      win = {
        border = "rounded",
        no_overlap = true,
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        zindex = 1000,
        wo = {
          winblend = 0,
        },
      },
      layout = {
        width = { min = 22, max = 52 },
        spacing = 4,
      },
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      replace = {
        desc = {
          { "<[cC]md>", "" },
          { "^%+", "" },
          { "^:%s*", "" },
          function(desc)
            local dict = {
              ["Open"] = "Открыть",
              ["Close"] = "Закрыть",
              ["Toggle"] = "Переключить",
              ["Next"] = "Следующий",
              ["Previous"] = "Предыдущий",
              ["Buffer"] = "Буфер",
              ["Buffers"] = "Буферы",
              ["Window"] = "Окно",
              ["Windows"] = "Окна",
              ["File"] = "Файл",
              ["Files"] = "Файлы",
              ["Find"] = "Найти",
              ["Search"] = "Поиск",
              ["Rename"] = "Переименовать",
              ["Diagnostics"] = "Диагностика",
              ["Terminal"] = "Терминал",
              ["Quit"] = "Выход",
              ["Help"] = "Справка",
              ["Code"] = "Код",
              ["Action"] = "Действие",
              ["Format"] = "Форматировать",
              ["Comment"] = "Комментарий",
            }
            for en, ru in pairs(dict) do
              desc = desc:gsub("%f[%a]" .. en .. "%f[%A]", ru)
            end
            return desc
          end,
        },
      },
      spec = {
        { "<leader>", group = "Лидер-меню" },
        { "<leader>q", group = "Диагностика (Trouble)" },
        { "<leader>t", group = "Тесты (Neotest)" },
        { "<leader>d", group = "Отладка (DAP)" },
        { "<leader>g", group = "Git и диффы" },
        { "<leader>f", group = "Поиск" },
        { "<leader>l", group = "TUI (LazyGit и др.)" },
        { "<leader>c", group = "Буферы и окна" },
        { "<leader>w", group = "Сохранение и окна" },
        { "<leader>x", group = "Закрытие" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Шпаргалка: клавиши для этого буфера",
      },
      -- Не используем <leader>wk: в NvChad он уже занят (поиск по префиксу в WhichKey).
      {
        "<leader>!",
        function()
          require("which-key").show { global = true }
        end,
        desc = "Шпаргалка: все доступные сочетания",
      },
    },
  },
}
