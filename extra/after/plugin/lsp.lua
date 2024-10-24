local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})
lspconfig.nil_ls.setup({})
lspconfig.marksman.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.yamlls.setup({})
lspconfig.bashls.setup({})
lspconfig.clangd.setup({
  cmd = { "clangd", "--offset-encoding=utf-16" }, -- Custom command for clangd
})
lspconfig.emmet_language_server.setup({})

-- lsp.on_attach(function(client, bufnr)
local opts = { buffer = bufnr, remap = false }

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--	vim.keymap.set("n", "<leader>vd", function() vim.diagnostics,open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostics.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostics.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)

-- Customize diagnostic signs
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
