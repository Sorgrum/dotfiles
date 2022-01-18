Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

syntax on

augroup OnedarkOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme onedark
augroup end
