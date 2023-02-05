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
      u.map("n", "<Leader>hs", gitsigns.stage_hunk)
      u.map("v", "<Leader>hs", function()
        gitsigns.stage_hunk { line ".", line "v" }
      end)
      u.map("n", "<leader>hS", gitsigns.stage_buffer)
      -- Reset
      u.map("n", "<Leader>hr", gitsigns.reset_hunk)
      u.map("v", "<Leader>hr", function()
        gitsigns.reset_hunk { line ".", line "v" }
      end)
      u.map("n", "<Leader>hR", gitsigns.reset_buffer)
      -- Navigate
      u.map("n", "<Leader>hp", gitsigns.prev_hunk)
      u.map("n", "<Leader>hn", gitsigns.next_hunk)
      -- Diff
      u.map("n", "<Leader>hd", gitsigns.diffthis)
      u.map("n", "<Leader>hD", function()
        gitsigns.diffthis "~"
      end)
      -- Misc
      u.map("n", "<Leader>hu", gitsigns.undo_stage_hunk)
      u.map("n", "<Leader>hv", gitsigns.preview_hunk)
      u.map("n", "<Leader>hb", function()
        gitsigns.blame_line { full = true }
      end)
    end,
  }
end

return M
