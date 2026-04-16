# Changelog

Все заметные изменения в конфигурации фиксируются здесь.

## [2026-04-16]

### Changed
- Объединены Python и Node/TypeScript настройки DAP в один spec `mfussenegger/nvim-dap`.
- Ansible-маппинги `<leader>te` переведены на `autocmd FileType ansible` (теперь создаются только в ansible-буферах).
- Для `nvim-lint` линтер `hadolint` переведён на filetype `dockerfile`.
- В `vim-terraform` отключён `terraform_fmt_on_save`; форматирование Terraform/HCL оставлено только через `conform.nvim`.
- В `mason.ensure_installed` удалён дублирующийся `ansible-language-server`.

### Added
- Добавлен плагин `b0o/SchemaStore.nvim`.
- Расширены настройки `yamlls`: подключены схемы SchemaStore и явные маппинги для Kubernetes, Docker Compose, Helm (`Chart.yaml`, `helmfile.yaml`) и Kustomize.
- В `neotest` добавлен адаптер `nvim-neotest/neotest-go`.

