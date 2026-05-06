return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
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
        "markdown",
      },
      highlight = {
        enable = true,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "―",
    },
  },
}
