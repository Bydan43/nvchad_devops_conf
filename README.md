# Neovim (NvChad) — краткая документация по этому конфигу

Конфиг основан на [NvChad](https://github.com/NvChad/NvChad) (ветка `v2.5`) и [lazy.nvim](https://github.com/folke/lazy.nvim). Пользовательские плагины лежат в `lua/plugins/`, общие настройки — в `lua/configs/`, сочетания клавиш — в `lua/mappings.lua`.

**Лидер-клавиша:** пробел (`<leader>` = ` `).
**История изменений:** см. [CHANGELOG.md](./CHANGELOG.md).

---

## Управление плагинами (lazy.nvim)

| Команда | Назначение |
|--------|------------|
| `:Lazy` | Открыть UI менеджера плагинов: обновление, отключение, логи. |
| `:Lazy sync` | Установить/обновить плагины по `lazy-lock.json`. |
| `:Lazy clean` | Удалить из кеша плагины, которых больше нет в спеках. |
| `:Lazy restore` | Откатить плагины к версиям из `lazy-lock.json`. |
| `:Lazy health` | Проверка здоровья lazy (если доступно в версии). |
| `:Lazy log` | Лог последних операций. |

**Зачем lock-файл:** `lazy-lock.json` фиксирует коммиты плагинов — одинаковое окружение на разных машинах и после `git clone`.

---

## LSP и инструменты (Mason)

Mason ставит бинарники (LSP, линтеры, форматтеры) в `stdpath("data")/mason/bin` (они попадают в `PATH` при старте Neovim).

| Команда | Назначение |
|--------|------------|
| `:Mason` | UI установки/обновления пакетов. |
| `:MasonInstall <имя>` | Установить один пакет. |
| `:MasonUninstall <имя>` | Удалить пакет. |

Список пакетов, которые конфиг просит подтянуть автоматически (`ensure_installed`), см. в `lua/plugins/init.lua` → блок `mason.nvim`.

---

## Форматирование и линтинг в этом конфиге

| Компонент | Файл | Назначение |
|-----------|------|------------|
| **conform.nvim** | `lua/configs/conform.lua` | Форматирование при сохранении (`BufWritePre`): Lua/CSS/HTML/JS/TS/React, HCL/Terraform, Bash, Python. |
| **nvim-lint** | `lua/configs/lint.lua` | Линтеры после сохранения (`BufWritePost`): ESLint (JS/TS), ansible-lint, hadolint для `Dockerfile`. |
| **vim-terraform** | `lua/plugins/vim-terraform.lua` | Подсветка Terraform и выравнивание HCL. Автоформат при сохранении отключён в пользу `conform.nvim`. |
| **SchemaStore + yamlls** | `lua/plugins/schemastore.lua`, `lua/configs/lspconfig.lua` | JSON/YAML-схемы для автодополнения и валидации (включая K8s, Compose, Helm, Kustomize). |

---

## Пользовательские плагины (`lua/plugins/`)

Ниже — то, что явно подключено в твоих спеках (плюс то, что тянется как зависимость).

### Инфраструктура и DevOps

| Плагин | Зачем |
|--------|--------|
| [hashivim/vim-terraform](https://github.com/hashivim/vim-terraform) | Terraform: подсветка и выравнивание HCL. |
| [towolf/vim-helm](https://github.com/towolf/vim-helm) | Подсветка Helm-шаблонов в YAML. |
| [mfussenegger/nvim-ansible](https://github.com/mfussenegger/nvim-ansible) | Ansible: удобства для плейбуков; запуск из маппинга `<leader>te` (только в `FileType=ansible`). |
| [crnvl96/lazydocker.nvim](https://github.com/crnvl96/lazydocker.nvim) | TUI Docker через команду `:LazyDocker`. Нужен CLI `lazydocker` и `docker`/`podman` в `PATH`. В `init.lua` в начало `PATH` добавляются типичные каталоги (Homebrew и др.), чтобы GUI Neovim видел те же бинарники, что и терминал. |
| [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) | Каталог JSON/YAML-схем для LSP (`yamlls`), улучшает валидацию и подсказки в инфраструктурных YAML-файлах. |

### Git

| Плагин | Зачем |
|--------|--------|
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Классические Git-команды из Vim (`:Git`, и т.д.). |
| [rbong/vim-flog](https://github.com/rbong/vim-flog) | Граф коммитов (`:Flog`). |
| [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) | Диффы и история файлов в отдельных окнах. |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Встроенный [lazygit](https://github.com/jesseduffield/lazygit) (`:LazyGit`). |

### Редактирование и навигация

| Плагин | Зачем |
|--------|--------|
| [andyg/leap.nvim](https://codeberg.org/andyg/leap.nvim) | Быстрый переход по видимому тексту (`s` / `S` / `gs` — см. ниже). |
| [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Единая навигация между окнами Neovim и панелями tmux (`Ctrl+h/j/k/l`). |
| [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Удобный выход из insert (дополняет `jj` в маппингах). |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Автозакрытие/переименование HTML/XML тегов (Treesitter). |

### Диагностика, списки, тесты, отладка

| Плагин | Зачем |
|--------|--------|
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Список диагностик LSP, quickfix/loclist в одном UI (`:Trouble*`). |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Подсветка `TODO`/`FIXME` и поиск через Telescope (`:TodoTelescope`). |
| [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) + [neotest-jest](https://github.com/nvim-neotest/neotest-jest) + [neotest-go](https://github.com/nvim-neotest/neotest-go) | Запуск тестов Jest и Go из редактора. |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Отладка по DAP (Python и TypeScript/Node в одном spec-конфиге). |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Панели breakpoints, стека, переменных для DAP. |
| [kevinhwang91/nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) | Улучшенный quickfix (фильтры, превью). |

### Зависимости и UI-хелперы

| Плагин | Зачем |
|--------|--------|
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Утилиты Lua для других плагинов. |
| [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) | Нормальные `vim.ui.select` / `input`. |
| [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI-компоненты (например, для lazydocker). |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Асинхронный I/O для экосистемы neotest. |

### База редактора (из `lua/plugins/init.lua`)

| Плагин | Зачем |
|--------|--------|
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Форматирование. |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Подключение LSP-серверов. |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | Установка LSP/линтеров/форматтеров. |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Синтаксис и парсинг через деревья. |
| [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) | Линтинг по типу файла. |

---

## Что ещё ставит NvChad (кратко)

Полный набор зависимостей смотри в `lazy-lock.json`. Типично там есть: `telescope.nvim`, `nvim-cmp`, `LuaSnip`, `gitsigns.nvim`, `nvim-tree.lua`, `which-key.nvim` и др.

**Шпаргалка по умолчанию NvChad:** в Neovim нажми `<Space> c h` (открыть cheatsheet), либо `:NvCheatsheet`.

---

## Подсказки по клавишам на русском (which-key)

Плагин [folke/which-key.nvim](https://github.com/folke/which-key.nvim) уже входит в NvChad. Дополнительно в `lua/plugins/which-key.lua` заданы **русские названия групп** (после пробела и буквы префикса, например `<leader>q`, откроется секция с русским заголовком).

Как пользоваться:

- Нажми **лидер** (`Пробел`) и **не спеши** сразу нажимать вторую клавишу: через короткую паузу откроется окно с подсказками по доступным продолжениям.
- Явный вызов шпаргалки:
  - `Пробел` `?` — подсказки с учётом текущего буфера (`global = false`);
  - `Пробел` `!` — все доступные сочетания (`global = true`). Знак `!` = `Shift` + `1` на обычной раскладке.

В NvChad также есть старые хоткеи WhichKey: `<leader>wk` (запрос префикса) и `<leader>wK` (полный список через команду `:WhichKey`).

Тексты отдельных действий берутся из поля `desc` в `lua/mappings.lua` — чем больше там русских описаний, тем понятнее всплывающее окно.

---

## Основные сочетания клавиш (`lua/mappings.lua`)

Нотация:

- `<C-...>` = удерживай `Ctrl` и нажми вторую клавишу.
- `<leader>` = пробел (`Space`).
- `n`, `i`, `v`, `t` в колонке "Режим" = normal / insert / visual / terminal.

Общие:

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `;` | `n` | Командная строка (как `:`). |
| `<leader> w` | `n` | Сохранить файл. |
| `<leader> cx` | `n` | Закрыть все буферы (NvChad tabufline). |
| `\` | `n` | Вертикальный сплит. |
| `jj` | `i` | Выход из insert в normal. |

Tmux (совместно с `vim-tmux-navigator`):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<C-h> <C-j> <C-k> <C-l>` | `n` | Переход между окнами / панелями tmux. |

Trouble и TODO:

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> qx` | `n` | Trouble: переключить окно. |
| `<leader> qw` | `n` | Trouble: диагностика workspace. |
| `<leader> qd` | `n` | Trouble: диагностика текущего файла. |
| `<leader> qq` | `n` | Trouble: quickfix. |
| `<leader> ql` | `n` | Trouble: location list. |
| `<leader> qt` | `n` | TODO в Trouble (`:TodoTrouble`). |
| `<leader> ft` | `n` | TODO в Telescope (`:TodoTelescope`). |

Тесты (neotest):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> tt` | `n` | Запустить ближайший тест. |
| `<leader> tf` | `n` | Запустить тесты файла. |
| `<leader> to` | `n` | Вывод теста (`:Neotest output`). |
| `<leader> ts` | `n` | Сводка (`:Neotest summary`). |

Отладка (DAP + dap-ui):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> du` | `n` | Показать/скрыть DAP UI. |
| `<leader> db` | `n` | Точка останова. |
| `<leader> ds` | `n` | Продолжить / старт отладки. |
| `<leader> dn` | `n` | Шаг с обходом (`step_over`). |

Git:

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> gl` | `n` | Git log (`:Flog`). |
| `<leader> gf` | `n` | История файла (Diffview). |
| `<leader> gc` | `n` | Дифф с `HEAD~1`. |
| `<leader> gt` | `n` | Переключить файл в Diffview history. |
| `<leader> lg` | `n` | LazyGit. |

Терминал (NvChad term):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `Ctrl + ]` (`<C-]>`) | `n`, `t` | Вертикальный терминал. |
| `Ctrl + \\` (`<C-\\>`) | `n`, `t` | Горизонтальный терминал. |
| `Ctrl + f` (`<C-f>`) | `n`, `t` | Плавающий терминал. |
| `<leader> x` | `t` | Закрыть терминальное окно. |

Ansible (только в буферах с `FileType=ansible`):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> te` | `n`, `v` | Запуск Ansible (`nvim-ansible`). |

Docker:

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `<leader> ld` | `n` | `:LazyDocker`. |

Leap (настроено в `lua/plugins/git-plugins.lua`):

| Клавиши | Режим | Действие |
|---------|-------|----------|
| `s` | `n`, `x`, `o` | Leap вперёд. |
| `S` | `n`, `x`, `o` | Leap назад. |
| `gs` | `n`, `x`, `o` | Leap в другое окно. |

---

## Если ругается на комментарий (`commentstring` / `modifiable`)

Сообщения вроде `Option 'commentstring' is empty` и `Buffer is not 'modifiable'` появляются у **встроенного** переключения комментария (в т.ч. через `<leader>/` из NvChad), если буфер только для чтения (help, часть UI плагинов) или для файла не задан тип/шаблон комментария.

В этом конфиге `<leader>/` переопределён в `lua/mappings.lua`: сначала проверяются `modifiable`, тип буфера и `commentstring`, затем вызывается встроенный API. Прямые хоткеи `gcc` / `gc` Neovim по-прежнему могут падать в тех же ситуациях — там проверок нет.

---

## Полезные ссылки

- [Документация NvChad](https://nvchad.com/docs/)
- [Конфигурация плагинов NvChad (lazy)](https://nvchad.com/docs/config/plugins/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
