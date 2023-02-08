local M = {
  "neovim/nvim-lspconfig",
}

function M.config()
  --configs.unigine_shaders = {
  --  default_config = {
  --    --cmd = {'/home/despair/test/c++/test'};
  --    cmd = {'/home/despair/git/unigine-lsp/target/debug/lsp-server'};
  --    filetypes = {'uusl'};
  --    root_dir = function(fname)
  --      return '/home/despair/dev/engine/data/materials'
  --    end;
  --    settings = {};
  --  }
  --}
  --
  --configs.unigine_shaders.setup{}
  local lsp = require "lspconfig"
  local configs = require "lspconfig.configs"
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { "clangd", "bashls", "cmake" }
  local default_config = {
    capabilities = capabilities,
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
      --on_attach = function()
      --end,
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
    lsp[server].setup(config)
  end
end

return M
