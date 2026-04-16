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

-- --------------------------------------------------
--                  Навигация в tmux
-- --------------------------------------------------
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

-- --------------------------------------------------
--                    Тесты
-- --------------------------------------------------
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

-- --------------------------------------------------
--                    Отладка
-- --------------------------------------------------
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

-- --------------------------------------------------
--                    Git
-- --------------------------------------------------
-- Показать лог изменений Git (<leader>gl в нормальном режиме)
map("n", "<leader>gl", ":Flog<CR>", { desc = "Показать лог Git" })

-- Показать историю изменений для текущего файла (<leader>gf в нормальном режиме)
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "История изменений файла" })

-- Показать последние изменения Git (<leader>gc в нормальном режиме)
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Последний коммит" })

-- Переключение вида истории файлов Git (<leader>gt в нормальном режиме)
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Переключить историю файла" })

-- --------------------------------------------------
--                    Terminal
-- --------------------------------------------------
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

-- --------------------------------------------------
--                    Ansible
-- --------------------------------------------------
map("v", "<leader>te", function()
  require("ansible").run()
end, { buffer = true, silent = true, desc = "Запустить Ansible (выделение)" })

map(
  "n",
  "<leader>te",
  ":w<CR> :lua require('ansible').run()<CR>",
  { buffer = true, silent = true, desc = "Запустить Ansible" }
)

-- --------------------------------------------------
--                    LazyGit
-- --------------------------------------------------
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- --------------------------------------------------
--                    Базовые
-- --------------------------------------------------
-- Быстрый выход из режима вставки (jj в режиме вставки)
map("i", "jj", "<ESC>", { desc = "Выйти из вставки (как Esc)" })

-- Закрыть терминал с помощью <leader>x (только в терминальном режиме)
map("t", "<leader>x", "<C-\\><C-n>:q<CR>", { desc = "Закрыть терминал" })

-- --------------------------------------------------
-- Комментарий (<leader>/) — безопасная замена встроенного gcc/gc
-- NvChad по умолчанию: map("n", "<leader>/", "gcc", { remap = true }).
-- В буферах nomodifiable или без commentstring встроенный код падает с E5108.
-- --------------------------------------------------
local function ensure_commentstring()
  if vim.bo.commentstring ~= nil and vim.bo.commentstring ~= "" then
    return true
  end
  local ft = vim.bo.filetype
  if ft and ft ~= "" then
    local ok, cs = pcall(vim.filetype.get_option, ft, "commentstring")
    if ok and cs and cs ~= "" then
      vim.bo.commentstring = cs
      return true
    end
  end
  return false
end

local function safe_comment_toggle(line_start, line_end, ref_pos)
  if not vim.bo.modifiable then
    vim.notify("Буфер только для чтения — нельзя переключить комментарий.", vim.log.levels.WARN)
    return
  end
  local bt = vim.bo.buftype
  if bt == "help" or bt == "quickfix" or bt == "terminal" or bt == "prompt" then
    vim.notify("В этом типе буфера комментирование не используется.", vim.log.levels.WARN)
    return
  end
  if not ensure_commentstring() then
    vim.notify(
      "Не задан commentstring. Задай тип файла (:set ft=...) или открой файл с известным расширением.",
      vim.log.levels.WARN
    )
    return
  end
  local ok_mod, comment = pcall(require, "vim._comment")
  if not ok_mod or type(comment.toggle_lines) ~= "function" then
    vim.notify("Встроенный модуль комментариев недоступен.", vim.log.levels.WARN)
    return
  end
  local ok, err = pcall(comment.toggle_lines, line_start, line_end, ref_pos)
  if not ok then
    vim.notify("Не удалось переключить комментарий: " .. tostring(err), vim.log.levels.WARN)
  end
end

map("n", "<leader>/", function()
  local l = vim.fn.line(".")
  safe_comment_toggle(l, l, vim.api.nvim_win_get_cursor(0))
end, { desc = "Переключить комментарий строки" })

map("v", "<leader>/", function()
  local a = vim.fn.line("v")
  local b = vim.fn.line(".")
  local start = math.min(a, b)
  local finish = math.max(a, b)
  safe_comment_toggle(start, finish, { start, 0 })
end, { desc = "Переключить комментарий выделения" })
