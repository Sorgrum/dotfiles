"
"       Personal vim configuration of Marcelo Gheiler <me@marcelogheiler.com>
"
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup/
set clipboard=unnamedplus
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
syntax enable

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>vs :vsp<cr>
nmap <leader>v<cr> :sp<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
 
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/copilot.vim
source ~/.config/nvim/plugins/css-color.vim
source ~/.config/nvim/plugins/exchange.vim
source ~/.config/nvim/plugins/guess-indent.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/lightspeed.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/onedark.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/rainbow.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/smoothie.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/trouble.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

filetype plugin on

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

