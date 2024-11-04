-- Плагины для отладки (DAP - Debug Adapter Protocol)
return {
  -- Отладки Python  
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}', -- This will launch the current file
          pythonPath = function()
            return 'python'
          end,
        },
      }
    end,
  },

   -- Отладки Node
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },
}