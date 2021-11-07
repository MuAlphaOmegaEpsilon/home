lua <<EOF
local lsp = require'lspconfig'

lsp.clangd.setup
{
	default_config =
	{
		cmd = {	'clangd', '--background-index', '--header-insertion=never', '--clang-tidy', '--suggest-missing-includes'}
	},
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
lsp.cmake.setup { config = { filetypes = { "cmake", "CMakeLists.txt" } }}
lsp.bashls.setup{}
lsp.diagnosticls.setup { config = { filetypes = { "sh", "bash" }}}
lsp.cssls.setup{}
lsp.dartls.setup{}
lsp.html.setup{}
lsp.vimls.setup{}
lsp.yamlls.setup{}
require'flutter-tools'.setup{}
EOF
