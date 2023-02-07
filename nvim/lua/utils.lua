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

return M
