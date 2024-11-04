  -- Поддержка подсветки синтаксиса Terraform и автоматического форматирования
return {
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_fmt_on_save = 1 -- Автоматическое форматирование при сохранении
      vim.g.terraform_align = 1       -- Включение выравнивания для HCL синтаксиса
    end,
  },
}