-- Плагин для отображения списка диагностик, быстрых исправлений и задач
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      auto_close = true,
      auto_open = false,
      auto_preview = true,
      focus = false,
      follow = true,
      pinned = false,
      restore = true,
      win = {
        type = "split",
        position = "right",
        size = 0.32,
      },
      modes = {
        diagnostics_buffer = {
          mode = "diagnostics",
          filter = { buf = 0 },
        },
        diagnostics_errors = {
          mode = "diagnostics",
          filter = { severity = vim.diagnostic.severity.ERROR },
        },
      },
    },
  },
}
