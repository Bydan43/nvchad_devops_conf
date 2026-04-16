-- Улучшенный UI файлового дерева для DevOps-проектов
return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Файлы: показать/скрыть" },
      { "<leader>o", "<cmd>NvimTreeFocus<CR>", desc = "Файлы: фокус" },
    },
    opts = function(_, opts)
      opts.view = vim.tbl_deep_extend("force", opts.view or {}, {
        width = 36,
        preserve_window_proportions = true,
        signcolumn = "yes",
      })

      opts.renderer = vim.tbl_deep_extend("force", opts.renderer or {}, {
        highlight_git = true,
        highlight_opened_files = "name",
        highlight_modified = "all",
        add_trailing = false,
        group_empty = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      })

      opts.modified = vim.tbl_deep_extend("force", opts.modified or {}, {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      })

      opts.git = vim.tbl_deep_extend("force", opts.git or {}, {
        enable = true,
        ignore = false,
        timeout = 300,
      })

      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 100,
        icons = {
          hint = "󰌵",
          info = "󰋼",
          warning = "",
          error = "",
        },
      })

      opts.filters = vim.tbl_deep_extend("force", opts.filters or {}, {
        dotfiles = false,
        git_ignored = false,
      })

      opts.actions = vim.tbl_deep_extend("force", opts.actions or {}, {
        open_file = {
          resize_window = true,
          quit_on_open = false,
        },
      })

      return opts
    end,
  },
}
