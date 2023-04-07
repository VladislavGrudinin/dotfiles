local M = {}

M.map = function(modes, bind, exec, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(modes, bind, exec, options)
end

M.buf_map = function(mode, bind, exec, opts)
  local options = { noremap = true, silent = true, buffer = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, bind, exec, options)
end

M.git_email = function()
  local def_value = "vlad.grudinin"
  local handle = io.popen "git config --get user.email"
  if handle == nil then
    return def_value
  end
  local result = handle:read "*a"
  handle:close()
  result = string.gsub(result, "\n", "")
  local idx = string.find(result, "@") or #result + 1
  result = string.sub(result, 1, idx - 1)
  return #result > 0 and result or def_value
end

M.on_attach = function(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
    au CursorHold   <buffer> lua vim.lsp.buf.document_highlight()
    au CursorHoldI  <buffer> lua vim.lsp.buf.document_highlight()
    au CursorMoved  <buffer> lua vim.lsp.buf.clear_references()
    au CursorMovedI <buffer> lua vim.lsp.buf.clear_references()

    au CursorHold   <buffer> lua vim.diagnostic.open_float(nil, { focusable = false })
  ]]
  end
  if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
    local semantic = client.config.capabilities.textDocument.semanticTokens
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
      range = true,
    }
  end
end

return M
