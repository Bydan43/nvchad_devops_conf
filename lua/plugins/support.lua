-- Зависимости
return {

  -- Плагины для улучшения интерфейса в некоторых окнах Neovim
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "MunifTanjim/nui.nvim",
  },

  -- Плагин для избегания дублирования кода.
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  
}