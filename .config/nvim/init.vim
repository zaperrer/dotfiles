" Install Vim Plug in new setups
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
" Install nodejs for coc
if !executable('node')
  silent !curl -fLs install-node.now.sh | sh
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim' " Trying lightline with challenger deep
Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug '~/.local/share/nvim/local_plugged/dracula_pro'
" Plug 'Mofiqul/dracula.nvim'
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'audibleblink/hackthebox.vim'
call plug#end()

" Plugin Settings
" set termguicolors
let g:coc_global_extensions = ['coc-python', 'coc-pairs', 'coc-json', 'coc-eslint']
" let g:rainbow_active = 1
colorscheme dracula
let g:airline_theme='dracula'
" colorscheme dracula_pro
" let g:airline_theme='dracula_pro'
" colorscheme hackthebox
" colorscheme challenger_deep
" let g:lightline = { 'colorscheme': 'challenger_deep'}


" Shortcuts
let mapleader = ","
nmap <C-n> :NERDTreeToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tab => 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Fuzzy File Finding :find
set path+=**
set wildmenu

set lazyredraw
set ignorecase
set smartcase
set showmatch
