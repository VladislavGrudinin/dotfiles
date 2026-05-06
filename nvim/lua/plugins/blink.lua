local M = {
  "saghen/blink.cmp",
  build = function() require("blink.cmp").build():wait(60000) end,
  dependencies = { "saghen/blink.lib" },
  opts_extend = { "sources.default" },
  opts = {
    keymap = { preset = "enter" },
    completion = {
      list = { selection = { preselect = true, auto_insert = true } },
      documentation = { auto_show = true },
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
    },
    snippets = { preset = "luasnip" },
    appearance = {
      nerd_font_variant = "mono",
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  }
}

return M
