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
    },
  },
}

return M
