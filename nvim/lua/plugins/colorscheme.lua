return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(h, c)
        -- treesitter
        h["@type.qualifier"] = { link = "@keyword" }
        h["@storageclass"] = { link = "@keyword" }
        h["@constant.builtin"] = { link = "Constant" }

        -- semantic tokens
        h["@lsp.typemod.variable.globalScope"] = { fg = c.red }
        h["@lsp.typemod.variable.fileScope"] = { fg = c.red }
        h["@lsp.typemod.variable.classScope"] = { fg = c.orange }
        h["@lsp.typemod.function.classScope"] = { fg = c.orange }
        h["@lsp.typemod.class.constructorOrDestructor"] = { link = "@lsp.type.function" }
        h["@lsp.type.macro"] = { fg = c.red }
      end,
      on_colors = function(colors)
        colors.yellow = "#d4c02a";
      end,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd [[colorscheme tokyonight-storm]]
    end,
  },
}
