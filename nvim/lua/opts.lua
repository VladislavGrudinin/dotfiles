local g = vim.g
g.mapleader = " "
g.load_ruby_provider = false
g.load_perl_provider = false
g.load_node_provider = false

local o = vim.opt
o.exrc = true
o.secure = true
o.ic = true
o.scs = true
o.nu = true
o.rnu = true
o.cursorline = true
o.encoding = "utf-8"
-- fucking slow
--o.foldmethod = 'syntax'
--o.foldlevel = 3
o.showtabline = 2
o.shortmess = "aoOtTcF"
o.splitbelow = true
o.pumheight = 20
o.scrolloff = 15
o.signcolumn = "yes"
o.termguicolors = true
o.completeopt = { "noinsert", "menuone", "noselect" }
o.laststatus = 2
o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
o.list = true
o.listchars = { tab = "▸ ", space = "·", eol = "↲", extends = "❯", precedes = "❮", trail = "~", nbsp = "⦸" }
o.updatetime = 500
o.helpheight = 99999
o.mouse = ""

local signs = { Error = "✘", Warn = "", Hint = "💡", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = {
    source = true,
    prefix = "",
  },
}

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[
  "au CursorHold   * lua vim.lsp.buf.document_highlight()
  "au CursorHoldI  * lua vim.lsp.buf.document_highlight()
  "au CursorMoved  * lua vim.lsp.buf.clear_references()
  "au CursorMovedI * lua vim.lsp.buf.clear_references()
]]
