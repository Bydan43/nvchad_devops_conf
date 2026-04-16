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
    url = "https://codeberg.org/andyg/leap.nvim",
    lazy = false,
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
    end,
  },
}