require "nvchad.mappings"

local map = vim.keymap.set

-- Войти в режим команд с помощью ";" (нормальный режим)
map("n", ";", ":", { desc = "Войти в режим команд" })

-- Сохранить файл (<leader>w в нормальном режиме)
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить" })

-- Закрыть все буферы (<leader>cx в нормальном режиме)
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Закрыть все буферы" })

-- Найти заметки Todo с помощью Telescope (<leader>ft в нормальном режиме)
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Найти Todo" })

-- Вертикальный сплит (разделение окна) (\ в нормальном режиме)
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Вертикальный сплит" })

-- -----------------------------
--        Навигация в tmux
-- -----------------------------
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux вправо" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux влево" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux вверх" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux вниз" })

-- ---------------------------------------------------------
-- Trouble: инструмент для отображения проблем и диагностик
-- ---------------------------------------------------------
-- Открыть Trouble (<leader>qx в нормальном режиме)
map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Открыть Trouble" })

-- Открыть Trouble с диагностикой для рабочей области (<leader>qw в нормальном режиме)
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Открыть Trouble для рабочей области" })

-- Открыть Trouble с диагностикой для документа (<leader>qd в нормальном режиме)
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Открыть Trouble для документа" })

-- Открыть Quickfix в Trouble (<leader>qq в нормальном режиме)
map("n", "<leader>qq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Открыть Quickfix" })

-- Открыть список местоположений в Trouble (<leader>ql в нормальном режиме)
map("n", "<leader>ql", "<cmd>TroubleToggle loclist<CR>", { desc = "Открыть список местоположений" })

-- Открыть заметки Todo в Trouble (<leader>qt в нормальном режиме)
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Открыть Todo в Trouble" })

-- -----------------------------
--          Тесты
-- ----------------------------
-- Запустить ближайший тест (<leader>tt в нормальном режиме)
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Запустить ближайший тест" })

-- Запустить тест для текущего файла (<leader>tf в нормальном режиме)
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Запустить тест для файла" })

-- Показать вывод теста (<leader>to в нормальном режиме)
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Показать вывод теста" })

-- Показать сводку тестов (<leader>ts в нормальном режиме)
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Показать сводку тестов" })

-- ---------------------------
--          Отладка
-- ---------------------------
-- Открыть/закрыть интерфейс отладки (<leader>du в нормальном режиме)
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Открыть/закрыть интерфейс отладки" })

-- Поставить/снять точку останова (<leader>db в нормальном режиме)
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Поставить/снять точку останова" })

-- Начать отладку (<leader>ds в нормальном режиме)
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Начать отладку" })

-- Шаг через (<leader>dn в нормальном режиме)
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Шаг через" })

-- -------------------------
--          Git
-- -------------------------
-- Показать лог изменений Git (<leader>gl в нормальном режиме)
map("n", "<leader>gl", ":Flog<CR>", { desc = "Показать лог Git" })

-- Показать историю изменений для текущего файла (<leader>gf в нормальном режиме)
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "История изменений файла" })

-- Показать последние изменения Git (<leader>gc в нормальном режиме)
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Последний коммит" })

-- Переключение вида истории файлов Git (<leader>gt в нормальном режиме)
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Переключить историю файла" })

-- -------------------------
--          Terminal
-- -------------------------
-- Открыть/закрыть вертикальный терминал (Ctrl-] в нормальном режиме)
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Открыть/закрыть вертикальный терминал" })

-- Открыть/закрыть горизонтальный терминал (Ctrl-\ в нормальном режиме)
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Открыть/закрыть горизонтальный терминал" })

-- Открыть/закрыть терминал в плавающем окне (Ctrl-f в нормальном режиме)
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Открыть/закрыть терминал в плавающем окне" })

-- Привязки для закрытия терминала в режиме терминала (только в терминальном режиме)
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Открыть/закрыть вертикальный терминал" })

map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Открыть/закрыть горизонтальный терминал" })

map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Открыть/закрыть терминал в плавающем окне" })

-- -------------------------
--          Ansible
-- -------------------------
map('v', '<leader>te', function()
  require('ansible').run()
end, { buffer = true, silent = true, })

map('n', '<leader>te', ":w<CR> :lua require('ansible').run()<CR>", { buffer = true, silent = true, desc = "Ansible run" })

-- -------------------------
--          Kubectl
-- -------------------------
map("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true, desc = "kubect" })

-- -------------------------
--          LazyGit
-- -------------------------
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- -------------------------
--          Базовые
-- -------------------------
-- Быстрый выход из режима вставки (jj в режиме вставки)
map("i", "jj", "<ESC>")

-- Закрыть терминал с помощью <leader>x (только в терминальном режиме)
map("t", "<leader>x", "<C-\\><C-n>:q<CR>", { desc = "Закрыть плавающе окна" })

-- Принять автодополнение от Codeium (Ctrl-g в режиме вставки)
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })
