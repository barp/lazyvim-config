return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.go_remote = {
        type = "server",
        host = "127.0.0.1",
        port = 2345,
      }
    end,
  },
}
