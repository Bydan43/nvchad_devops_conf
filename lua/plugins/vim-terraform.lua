  -- Поддержка подсветки синтаксиса Terraform и автоматического форматирования
return {
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_fmt_on_save = 0 -- Форматирование делаем через conform.nvim
      vim.g.terraform_align = 1       -- Включение выравнивания для HCL синтаксиса
    end,
  },
}
