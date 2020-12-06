lua require'lspconfig'.clangd.setup { on_attach=require'completion'.on_attach, config = { cmd = { "clangd-10 --background-index --clang-tidy --header-insertion=never --header-insertion-decorator --suggest-missing-includes" }}}
lua require'lspconfig'.cmake.setup { config = { filetypes = { "cmake", "CMakeLists.txt" } }}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.diagnosticls.setup { config = { filetypes = { "sh" }}}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.yamlls.setup{}
