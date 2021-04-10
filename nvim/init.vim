let mapleader = " "

""" Load Plugins
source $HOME/.config/nvim/plugins.vim 


""" Default Options
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set mouse=a
set splitright
set splitbelow
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set number
set ignorecase
set smartcase
set incsearch
set nobackup
set nowritebackup
set signcolumn=yes
set updatetime=250

filetype plugin indent on
if (has("termguicolors"))
    set termguicolors
endif


""" Mappings
nnoremap <leader>v :e $MYVIMRC<CR>

