-- Подсказки по клавишам: после <leader> появляется всплывающее окно с описаниями.
-- Тексты групп — на русском; у отдельных маппингов подписи задаются полем `desc` в mappings.lua.
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>q", group = "Диагностика (Trouble)" },
        { "<leader>t", group = "Тесты (Neotest)" },
        { "<leader>d", group = "Отладка (DAP)" },
        { "<leader>g", group = "Git и диффы" },
        { "<leader>f", group = "Поиск" },
        { "<leader>l", group = "TUI (LazyGit и др.)" },
        { "<leader>c", group = "Буферы и окна" },
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
