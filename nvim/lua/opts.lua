local g = vim.g
g.mapleader = " "
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

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
o.showtabline = 0
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
o.updatetime = 200
o.helpheight = 99999
o.mouse = ""

vim.diagnostic.config {
  virtual_text = {
    source = true,
    prefix = "",
  },
}

vim.cmd [[ filetype plugin indent on ]]
