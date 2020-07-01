" vim-plug {{{

call plug#begin()

Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'pboettch/vim-cmake-syntax'

Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

Plug 'CourrierGui/vim-potion'

call plug#end()

" }}}

" Mappings {{{

let mapleader = ","
let localmapleader = "\\"
nnoremap <leader>, ,

" Copy and pasting with system clipboard
vnoremap <C-y> "*y :let @+=@*<CR>
noremap <leader>p "+P`[v`]=

" Format paragraphs
nnoremap <leader>gp gwap

" Remove trailing whitespaces
nnoremap <leader>ws :%s/\v\s+$//<cr>:noh<cr>

" Easier move between methods
" nnoremap <leader>m ]m

" Make moving between wraped lines more intuitive
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

" Execute current line with your shell interpreter and paste result in buffer
nnoremap Q !!$SHELL<CR>

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

" Jump to char under cursor
nnoremap <silent> <leader>f :execute "normal! f" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>F :execute "normal! F" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>t :execute "normal! t" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>T :execute "normal! T" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>

" nnoremap <leader>sc :lclose<CR>
" nnoremap <leader>sn :lnext<CR>
" nnoremap <leader>sp :lprevious<CR>

nnoremap <leader><space> :noh<cr>
noremap <enter> o<esc>
nnoremap <leader>x xp

" Swap upper/lower case
nnoremap <leader>u g~iw
vnoremap <leader>u ~
inoremap <leader>u <esc>mzg~iwe`za

" Add ; to the end of the line in insert mode and puts the cursor back at the same place
" Usefull for C/C++ programing
inoremap <c-e> <esc>mzA;<esc>`za

" noremap <leader>- dd1kP
" noremap <leader>_ ddp

" buffer navigations
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bN :bp<CR>

" tag navigations
" nnoremap <leader>tn :tn<CR>
" nnoremap <leader>tN :tp<CR>

" make arrow keys usefull
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Enable folding with the spacebar
nnoremap <space> za
" Smallest fold level
" nnoremap <leader>fr :set foldlevel=1<CR>
" Unfold
" nnoremap <leader>fu :set foldlevel=2<CR>

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

nnoremap <leader>aa :call SwitchHeader("find")<CR>
nnoremap <leader>av :call SwitchHeader("vert sf")<CR>
nnoremap <leader>at :call SwitchHeader("tab sf")<CR>

" Vim sessions
" prepare command to create a new session
nnoremap <A-s>n :wa<Bar>mksession ~/.config/nvim/sessions/
" Save current session and prepare to load a new one
nnoremap <A-s>s :wa<Bar>exe "mksession! " . v:this_session<CR>
nnoremap <A-s>o :so ~/.config/nvim/sessions/

" Terminal Mappings
tnoremap <esc> <c-\><c-n>

" Operator-Pending Mappings
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" }}}

" Options {{{

" search for local config files at startup
set exrc
set secure

set number
set relativenumber
set ttimeoutlen=10
set splitbelow splitright

" Tab to spaces
set tabstop=2
set shiftwidth=2
" set expandtab

" File fuzzy finding
set path+=**
set wildignore+=**/build/**

" See matching character
set showmatch

" Better indentation
set smartindent
set cindent
set cino=j1,(0,ws,Ws " Better C++ indentation of lambda function

" Display trailing whitespace and tabs
set list
set listchars=tab:\ \ ,trail:·
" set listchars=tab:»·,trail:·

" french and english spelling
set spelllang=en,fr

" }}}

" Plugin options {{{

" vim-markdown
" set default markdown fold level
let g:vim_markdown_folding_level = 3
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1

" vim-airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='bubblegum'

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
nnoremap <leader>gd <Plug>(coc-definition)

" vimtex
let g:vimtex_compiler_progname = 'nvr'

" colorscheme zenburn
colorscheme dracula
" colorscheme gotham

" }}}

" Vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker | setlocal foldlevel=0
	autocmd BufLeave ~/.config/nvim/init.vim :source $MYVIMRC
augroup END
" }}}

" XML file settings {{{
augroup filetype_html
	autocmd!
	autocmd BufNewFile,BufRead *.launch,*.ui set filetype=xml
augroup END
" }}}

" Python file settings {{{
augroup filetype_python
	autocmd!
	autocmd BufnewFile,BufRead python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 autoindent fileformat=unix foldlevel=1
	autocmd Filetype python nnoremap <buffer> <localleader>r :CocCommand python.execInTerminal<CR>
augroup end
" }}}

" Julia file settings {{{
augroup filetype_python
	autocmd!
	autocmd BufNewFile,BufRead,BufNewFile *.jl :setlocal filetype=julia
augroup end
" }}}

" Markdown file settings {{{
augroup filetype_md
	autocmd!
	autocmd FileType markdown setlocal nocindent
	autocmd FileType markdown nnoremap <buffer> <localleader>s :!mupdf $(echo % \| sed 's/md$/pdf/') & disown<CR>
	autocmd FileType markdown nnoremap <buffer> <localleader>c :w<bar>!pandoc -so $(echo % \| sed 's/md$/pdf/') % <CR>:!pkill -HUP mupdf<CR>
augroup END
" }}}

" Functions {{{

function! SwitchHeader(cmd)
	let filename = expand("%:t:r")
	if expand("%:e") == "hpp"
		let filename = filename . ".cpp"
		execute(a:cmd . " " . filename)
	elseif expand("%:e") == "cpp"
		let filename = filename . ".hpp"
		execute(a:cmd . " " . filename)
	endif
endfunction

function! WC()
	let filename = expand("%")
	let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
	let result = system(cmd)
	echo result . " words"
endfunction

" }}}
