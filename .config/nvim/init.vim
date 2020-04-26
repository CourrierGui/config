" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath

" vim-plug {{{

call plug#begin()

Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }}}

" Mappings {{{
let mapleader = ","
" let mapleader="\<Space>"
let localmapleader = "\\"

" Copy and pasting
vnoremap <C-y> "*y :let @+=@*<CR>
noremap <leader>p "+P`[v`]=

" Easier move between methods
nnoremap <leader>m ]m

" Make moving between wraped lines more intuitive
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

" make moving between buffers easier
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" make scolling faster
nnoremap J 5j
nnoremap K 5k
noremap <leader>j J
noremap <leader>k K

nnoremap <leader>sc :lclose<CR>
nnoremap <leader>sn :lnext<CR>
nnoremap <leader>sp :lprevious<CR>

nnoremap <leader><space> :noh<cr>
nnoremap <leader>x xp
nnoremap <enter> o<esc>
noremap <leader>- dd2kp
noremap <leader>_ ddp

" buffer navigations
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bN :bp<CR>

" tag navigations
nnoremap <leader>tn :tn<CR>
nnoremap <leader>tN :tp<CR>

" make arrow keys usefull
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <leader>rf :set foldlevel=1<CR>
nnoremap <leader>uf :set foldlevel=2<CR>

" TagBar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"Editing and sourcing ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" netrw
nnoremap <leader>ee :Explore<CR>
nnoremap <leader>le :Lexplore<bar>vertical resize 30<CR>

" move block of code
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
" }}}

" Options {{{

set number
set relativenumber
set ttimeoutlen=10

" Tab to spaces
set tabstop=2
set shiftwidth=2
set expandtab

" File fuzzy finding
set path+=**
set wildignore+=**/build/**

" See matching character
set showmatch

" Better indentation
set smartindent
set cindent
set cino=j1,(0,ws,Ws " Better C++ indentation of lambda function

" french and english spelling
set spelllang=en,fr

" }}}

" Plugin options {{{

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='base16'

" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}


" colorscheme zenburn
colorscheme dracula
" colorscheme gotham

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker | setlocal foldlevel=0
augroup END
" }}}

" Python file settings {{{
augroup filetype_python
    autocmd!
	" enable folding
	autocmd bufnewfile,bufread python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix foldlevel=1
  autocmd filetype python nnoremap <leader>r :CocCommand python.execInTerminal<CR>
augroup end
" }}}
