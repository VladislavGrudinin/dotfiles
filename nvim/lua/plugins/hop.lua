return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup()
  end,
  keys = {
    { "<leader>j", "<cmd>HopWord<cr>", mode = { "n", "v", "o" } },
    { "<leader>c", "<cmd>HopChar1<cr>", mode = { "n", "v", "o" } },
  },
}
