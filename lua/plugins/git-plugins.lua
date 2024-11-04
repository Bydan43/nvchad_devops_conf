return {

  -- Поддержка работы с Git
  {
    "tpope/vim-fugitive" 
  },

  -- Интерфейс для истории коммитов Git
  {
    "rbong/vim-flog",
    lazy = false,
    dependencies = { "tpope/vim-fugitive" },
  },

  -- Интерфейс для просмотра различий в файлах
  { "sindrets/diffview.nvim",
    lazy = false
  },

  -- Быстрый поиск и перемещение по тексту
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
}