local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

function M.config()
  require("gitsigns").setup {
    signs = {
      add = { text = "▌" },
      change = { text = "▌" },
    },

    on_attach = function()
      local u = require "utils"
      local gitsigns = package.loaded.gitsigns
      local line = vim.fn.line
      -- Stage
      u.map("n", "<leader>hs", gitsigns.stage_hunk)
      u.map("v", "<leader>hs", function()
        gitsigns.stage_hunk { line ".", line "v" }
      end)
      u.map("n", "<leader>hS", gitsigns.stage_buffer)
      -- Reset
      u.map("n", "<leader>hr", gitsigns.reset_hunk)
      u.map("v", "<leader>hr", function()
        gitsigns.reset_hunk { line ".", line "v" }
      end)
      u.map("n", "<leader>hR", gitsigns.reset_buffer)
      -- Navigate
      u.map("n", "<leader>hp", gitsigns.prev_hunk)
      u.map("n", "<leader>hn", gitsigns.next_hunk)
      -- Diff
      u.map("n", "<leader>hd", gitsigns.diffthis)
      u.map("n", "<leader>hD", function()
        gitsigns.diffthis "~"
      end)
      -- Misc
      u.map("n", "<leader>hu", gitsigns.undo_stage_hunk)
      u.map("n", "<leader>hv", gitsigns.preview_hunk)
      u.map("n", "<leader>hb", function()
        gitsigns.blame_line { full = true }
      end)
    end,
  }
end

return M
