local M = {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
}

function add_custom_servers()
  local configs = require "lspconfig.configs"
  configs.unigine_shaders = {
    default_config = {
      cmd = { "/home/despair/git/unigine-lsp/target/debug/lsp-server" },
      filetypes = { "uusl" },
      root_dir = function(fname)
        return "/home/despair/dev/engine/data/core/materials"
      end,
    },
  }
end

function M.config()
  --add_custom_servers()

  --local lsp = require "lspconfig"
  --local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { "clangd", "bashls", "cmake" }
  local default_config = {
    --capabilities = capabilities,
    on_attach = require("utils").on_attach,
  }

  local configs = {
    clangd = {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=never",
      },
    },
  }

  local function config_or_default(server)
    local config = configs[server]
    if config == nil then
      return default_config
    end
    return vim.tbl_extend("force", default_config, config)
  end

  for _, server in ipairs(servers) do
    local config = config_or_default(server)
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
    --lsp[server].setup(config)
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
      end
    end,
  })
end

return M
