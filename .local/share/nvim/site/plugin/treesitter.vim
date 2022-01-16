lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "cpp",
  sync_install = true,
  highlight = {
  	enable = {"cpp"},
    additional_vim_regex_highlighting = false,
  },
}
EOF

