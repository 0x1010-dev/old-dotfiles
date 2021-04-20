" leader key
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""
" => Plugin Manager
""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

    " themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark.vim'

    " tools
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'

    " language
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration
""""""""""""""""""""""""""""""""""""""""

" airline
let g:airline#extensions#tabline#enable = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" nerdtree
nnoremap <C-b> :NERDTreeFocus<CR>

" CoC Mappings
" tab to trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" map <CR> auto-select the first completion item and notify coc to
" format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""""""""""""
" => Keymaps
""""""""""""""""""""""""""""""""""""""""

" search with space
map <space> /
map <C-space> ?

" diable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" move line of text using ALT+[jk] or Command+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""

" longer history
set history=5000

" filetype plugins
filetype plugin on
filetype indent on

" auto read when file changes
set autoread
au FocusGained,BufEnter *  checktime

" fast saving
nmap <leader>w :w!<cr>

" sudo saving
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" encoding
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""

" wild menu
set wildmenu

" show current position
set ruler
set number

" configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" search options
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" matching braces
set showmatch
set mat=2

" remove bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" better performance
set updatetime=300

" show signcolumn (for coc)
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""

" syntax highlighting
syntax on
colorscheme onedark

" no background
highlight Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""
" => Backups
""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""
" => Text
""""""""""""""""""""""""""""""""""""""""

" spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

