lua require'nvim_lsp'.clangd.setup { config = { cmd = { "clangd-10", "--background-index", "--clang-tidy", "--header-insertion=never" }}}
lua require'nvim_lsp'.cmake.setup { config = { filetypes = { "cmake", "CMakeLists.txt" } }}
lua require'nvim_lsp'.bashls.setup{}
lua require'nvim_lsp'.diagnosticls.setup { config = { filetypes = { "sh" }}}
