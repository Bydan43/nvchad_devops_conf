-- kubectl
return {
  {
    "ramilito/kubectl.nvim",
    lazy = false,
    config = function()
      require("kubectl").setup()
    end,
  },
}