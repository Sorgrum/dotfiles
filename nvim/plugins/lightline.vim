Plug 'itchyny/lightline.vim'

" tmux integration
Plug 'edkolev/tmuxline.vim'

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = "full"

let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'component_function': {
    \ 'filename': 'LightlineFilename',
    \ }
  \ }

set noshowmode

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
