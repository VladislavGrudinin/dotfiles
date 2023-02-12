local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local default_picker_opts = {
    theme = "dropdown",
    previewer = false,
    layout_config = {
      height = 0.99,
      width = 0.6,
    },
  }

  local preview_picker_horizontal = {
    layout_strategy = "horizontal",
    fname_width = 60,
    symbol_width = 60,
    layout_config = {
      width = 0.99,
      height = 0.99,
      prompt_position = "bottom",
      preview_width = 0.45,
    },
  }

  local preview_picker_vertical = {
    layout_strategy = "vertical",
    fname_width = 60,
    symbol_width = 60,
    layout_config = {
      width = 0.9,
      height = 0.95,
      prompt_position = "bottom",
    },
  }

  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
      prompt_prefix = "  ",
      selection_caret = "➤ ",

      path_display = { "truncate" },
    },
    pickers = {
      find_files = default_picker_opts,
      buffers = default_picker_opts,
      diagnostics = preview_picker_vertical,
      live_grep = preview_picker_horizontal,
      grep_string = preview_picker_horizontal,
      current_buffer_fuzzy_find = preview_picker_horizontal,
      lsp_references = preview_picker_horizontal,
      lsp_document_symbols = preview_picker_horizontal,
      lsp_dynamic_workspace_symbols = preview_picker_horizontal,
      lsp_definitions = preview_picker_horizontal,
      lsp_implementations = preview_picker_horizontal,
      jumplist = preview_picker_horizontal,
      help_tags = preview_picker_horizontal,
    },
  }
  -- Keys
  -- Telescope
  local u = require "utils"
  local telescope = require "telescope.builtin"
  -- Generic
  u.map("n", "<Leader>t", telescope.find_files)
  u.map("n", "<Leader>b", telescope.buffers)
  u.map("n", "<Leader>r", telescope.resume)
  -- Show
  u.map("n", "<Leader>sr", telescope.registers)
  u.map("n", "<Leader>sj", telescope.jumplist)
  u.map("n", "<Leader>sd", function()
    telescope.diagnostics { bufnr = 0 }
  end)
  -- Grep
  u.map("n", "<Leader>gg", telescope.live_grep)
  u.map("v", "<Leader>gw", function()
    local _, ls, cs = unpack(vim.fn.getpos "v")
    local _, le, ce = unpack(vim.fn.getpos ".")
    local st = table.concat(vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {}))
    telescope.grep_string { search = st, word_match = "-w" }
  end)
  u.map("n", "<Leader>gf", telescope.current_buffer_fuzzy_find)
  -- Go
  u.map("n", "<Leader>gr", telescope.lsp_references)
  u.map("n", "<Leader>gm", telescope.lsp_document_symbols)
  u.map("n", "<Leader>ga", telescope.lsp_dynamic_workspace_symbols)
  u.map("n", "<Leader>gd", telescope.lsp_definitions)
  u.map("n", "<Leader>gi", telescope.lsp_implementations)
  -- Question
  u.map("n", "<Leader>qk", telescope.keymaps)
  u.map("n", "<Leader>qh", telescope.help_tags)
end

return M
