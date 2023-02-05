return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      view = {
        width = 50,
        adaptive_size = true,
        number = false,
        signcolumn = "no",
        relativenumber = true,
        mappings = {
          custom_only = false,
          list = {},
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
    keys = {
      { "<F2>", "<cmd>NvimTreeToggle<cr>" },
      { "<leader>f", "<cmd>NvimTreeFindFile<cr>" },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      vim.cmd [[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]
    end,
  },
}
