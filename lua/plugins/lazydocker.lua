-- LazyDocker
return {
  {
    "crnvl96/lazydocker.nvim",
    lazy = true,
    config = function ()
      require("lazydocker").setup()
    end,
    cmd = {
      "LazyDocker",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "LazyDocker" }
    }
  },
}