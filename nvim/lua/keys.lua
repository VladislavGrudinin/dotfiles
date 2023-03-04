local u = require "utils"

-- Generic
u.map("n", "<C-j>", ":bprevious<CR>")
u.map("n", "<C-k>", ":bnext<CR>")
u.map("n", "<C-c>", ":noh<CR>")
u.map("n", "<Leader>q", ":bp <BAR> bd #<CR>")

u.map("n", "<F7>", ":%d <bar> 0r /home/despair/test/olymp/template.cc<CR> /solve<CR> <C-c> o")

u.map("n", "<Leader>di", ":lua vim.lsp.buf.code_action()<CR>")
u.map("n", "<Leader>dr", ":lua vim.lsp.buf.rename()<CR>")
u.map("n", "<Leader>df", ":lua vim.lsp.buf.format()<CR>")
u.map("v", "<Leader>df", function()
  vim.lsp.buf.format()
  vim.cmd [[ execute "normal \<Esc>" ]]
end)

u.map("n", "<Leader>ge", ":lua vim.lsp.buf.declaration()<CR>")
u.map("n", "<Leader>gn", ":lua vim.diagnostic.goto_next()<CR>")
u.map("n", "<Leader>gp", ":lua vim.diagnostic.goto_prev()<CR>")
u.map("n", "<Leader>gs", ":ClangdSwitchSourceHeader<CR>")

u.map("n", "<Leader>sh", ":lua vim.lsp.buf.hover()<CR>")
u.map("n", "<Leader>se", ":lua vim.diagnostic.open_float()<CR>")
u.map("n", "<Leader>si", ":lua vim.lsp.buf.signature_help()<CR>")
