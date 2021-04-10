" Auto-Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.nvim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugin List
call plug#begin('~/.plugged')

    " Formatting
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'

    " Themes and Layout
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark.vim'
    Plug 'szw/vim-maximizer'

    " Tools
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'kassio/neoterm'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'

    " Languages
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'sheerun/vim-polyglot'

call plug#end()


" airline 
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

" onedark
syntax on
colorscheme onedark
highlight Normal guibg=None ctermbg=None

" maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" neoterm
let g:neoterm_default_mod= 'vertical'
let g:neoterm_size = 80
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" fzf
nnoremap <leader>p :FZF<CR>
nnoremap <leader><S-p> :Ag<CR>


" lspconfig and completion
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach } 

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Auto-Install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif
