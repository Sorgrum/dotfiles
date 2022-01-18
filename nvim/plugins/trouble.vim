" Vim Script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Vim Script
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

function TroubleSetup()
lua << EOF
  require("trouble").setup {
      auto_open = true,
    auto_close = false -- automatically close the list when you have no diagnostics
  }
EOF
endfunction

augroup TroubleSetup
    autocmd!
    autocmd User PlugLoaded call TroubleSetup()
augroup END
