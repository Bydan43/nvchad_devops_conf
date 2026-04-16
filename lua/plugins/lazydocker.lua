-- LazyDocker: у плагина нет встроенной Ex-команды :LazyDocker, только Lua API.
-- Поле cmd = { "LazyDocker" } в lazy.nvim создаёт заглушку и после загрузки ждёт
-- настоящую команду с тем же имени → "Command not found". Регистрируем команду сами.
return {
  {
    "crnvl96/lazydocker.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("lazydocker").setup()
      vim.api.nvim_create_user_command("LazyDocker", function()
        require("lazydocker").toggle { engine = "docker" }
      end, { desc = "Открыть/закрыть LazyDocker (Docker)" })
    end,
    keys = {
      { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "LazyDocker" },
    },
  },
}