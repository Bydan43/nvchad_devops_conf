return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2500,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.45)
      end,
      top_down = false,
      render = "wrapped-compact",
      stages = "fade",
      fps = 60,
      background_colour = "#000000",
    },
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
      progress = {
        display = {
          progress_icon = { pattern = "dots" },
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = { enabled = false },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      messages = {
        enabled = true,
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      views = {
        cmdline_popup = {
          position = {
            row = "35%",
            col = "50%",
          },
          size = {
            width = 70,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      routes = {
        {
          filter = { event = "msg_show", find = "written" },
          opts = { skip = true },
        },
      },
    },
    keys = {
      {
        "<leader>hn",
        function()
          require("noice").cmd "history"
        end,
        desc = "История уведомлений",
      },
      {
        "<leader>hd",
        function()
          require("noice").cmd "dismiss"
        end,
        desc = "Очистить уведомления",
      },
      {
        "<leader>hm",
        function()
          require("noice").cmd "last"
        end,
        desc = "Последнее сообщение",
      },
    },
  },
}
