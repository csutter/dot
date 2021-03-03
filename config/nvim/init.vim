" Install vim-plug if it is missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin(stdpath('data') . '/plugged')
  " Editor improvements
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'

  " fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Text operations
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  " Language support
  "" Dotenv
  Plug 'tpope/vim-dotenv'
  "" Ruby/Rails
  Plug 'slim-template/vim-slim'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  "" Terraform
  Plug 'hashivim/vim-terraform'

  " Integrations
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'

  " Colours
  Plug 'arzg/vim-colors-xcode'
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

" Display
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set showcmd

" Async
set updatetime=100

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Colors
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" Dark mode handling
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Dark"
  set background=dark
  colorscheme xcodedarkhc
else
  set background=light
  colorscheme xcodelighthc
endif

" fzf configuration
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Ag<Cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" vim-signify configuration
let g:signify_sign_change = '~'
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete

" Window management
nmap <Space> <C-w>

" Custom leader shortcuts
nnoremap <Leader>l :set list!<CR>
nnoremap <Leader>R :source $MYVIMRC<CR>
