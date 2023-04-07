local M = {
  "neovim/nvim-lspconfig",
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
  add_custom_servers()

  local lsp = require "lspconfig"
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { "clangd", "bashls", "cmake", "unigine_shaders", "gopls" }
  local default_config = {
    capabilities = capabilities,
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
    gopls = {
      settings = {
        gopls = {
          semanticTokens = true,
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
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
    lsp[server].setup(config)
  end
end

return M
