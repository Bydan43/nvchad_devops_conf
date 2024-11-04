-- Плагин для легкого выхода из режима вставки (insert mode)
return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}