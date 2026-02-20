-- Debug: test keybindings and VS Code launch.json support
return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dL",
        function()
          require("dap.ext.vscode").load_launchjs(nil, {
            ["pwa-node"] = { "javascript", "typescript" },
            ["node"] = { "javascript", "typescript" },
            ["dlv"] = { "go" },
            ["debugpy"] = { "python" },
          })
          vim.notify("Loaded .vscode/launch.json", vim.log.levels.INFO)
        end,
        desc = "Load launch.json",
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    keys = {
      { "<leader>dt", false },
      {
        "<leader>dT",
        function()
          require("dap-go").debug_test()
        end,
        desc = "Debug Nearest Test (Go)",
        ft = "go",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      {
        "<leader>dT",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Nearest Test (Python)",
        ft = "python",
      },
    },
  },
}
