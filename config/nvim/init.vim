" Install vim-plug if it is missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin(stdpath('data') . '/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'arzg/vim-colors-xcode'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'machakann/vim-sandwich'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
call plug#end()

" Mouse
set mouse=a

" Indentation
set autoindent expandtab tabstop=2 shiftwidth=2 shiftround

" Rulers
set number
set cursorline
set colorcolumn=100

" Searching
set hlsearch incsearch smartcase

" Splits
set splitright splitbelow

" Colors
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme xcodelight

" fzf configuration
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Ag<Cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
