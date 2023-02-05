return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "cpp",
        "rust",
        "bash",
        "perl",
        "go",
        "lua",
        "python",
        "cmake",
      },
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "―",
    },
  },
}
