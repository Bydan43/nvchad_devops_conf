-- Подсказки по клавишам: после <leader> появляется всплывающее окно с описаниями.
-- Упрощенный режим: показываем только осмысленные (описанные) маппинги.
return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      delay = function(ctx)
        return ctx.plugin and 0 or 180
      end,
      filter = function(mapping)
        return mapping.desc and mapping.desc ~= ""
      end,
      sort = { "manual", "group", "alphanum" },
      expand = 0,
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
        spacing = 3,
      },
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = true,
          suggestions = 12,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
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
        { "<leader>h", group = "Справка и подсказки" },
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
        "<leader>hh",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Справка по клавишам (текущий буфер)",
      },
      {
        "<leader>hH",
        function()
          require("which-key").show { global = true }
        end,
        desc = "Справка по клавишам (все сочетания)",
      },
      {
        "<leader>hl",
        "<cmd>WhichKey <leader><CR>",
        desc = "Показать лидер-меню",
      },
      {
        "<leader>hk",
        "<cmd>NvCheatsheet<CR>",
        desc = "Шпаргалка NvChad",
      },
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Справка по клавишам (текущий буфер)",
      },
      {
        "<leader>!",
        function()
          require("which-key").show { global = true }
        end,
        desc = "Справка по клавишам (все сочетания)",
      },
    },
  },
}
