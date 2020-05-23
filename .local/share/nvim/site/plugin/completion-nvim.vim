lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}
autocmd BufEnter * lua require'completion'.on_attach()