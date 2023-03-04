local M = {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  opts = {
    server = {
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = { "inactive-code" },
          },
        },
      },
      on_attach = require("utils").on_attach,
    },
  },
}

return M
