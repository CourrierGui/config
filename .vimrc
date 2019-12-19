set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-latex/vim-latex'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/a.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'rdnetto/YCM-Generator'

" Plugin 'jistr/vim-nerdtree-tabs' " à enlever
" Plugin 'scrooloose/nerdtree' " à enlever
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " à enlever
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Mappings
" let mapleader = ","
let mapleader="\<Space>"
let localmapleader = "\\"

nnoremap <leader>sc :lclose<CR>
nnoremap <leader><space> :noh<cr>
noremap <leader>- dd2kp
noremap <leader>_ ddp
nnoremap <enter> o<esc>
" inoremap <c-u> <esc>veU<esc>ea
" nnoremap <c-u> veU<esc>
" inoremap <c-d> <esc>ddi

"split navigations
nnoremap <leader>h <c-w><c-h>
nnoremap <leader>j <c-w><c-j>
nnoremap <leader>k <c-w><c-k>
nnoremap <leader>l <c-w><c-l>

inoremap <leader>h <esc>i
inoremap <leader>j <esc>ja
inoremap <leader>k <esc>ka
inoremap <leader>l <esc>la
inoremap <leader>o <esc>o

" nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>N :bp<CR>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Enable folding with the spacebar
" nnoremap <space> za
nnoremap <leader>rf :set foldlevel=1<CR>
nnoremap <leader>uf :set foldlevel=2<CR>

nnoremap <leader>x xp
" nnoremap <leader>H 0
" nnoremap <leader>L $
" vnoremap <leader>q `><esc>i"<esc>v`<<esc>i"<esc>v

" TagBar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"Editing and sourcing ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Ultisnips
let g:tex_flavor='latex'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" SimpylFold
let g:SimpylFold_docstring_preview=1


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']


" vim-nerdtree-syntax-highlight
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" Color syntaxing
let python_highlight_all=1
syntax on

"Autopep8
let g:autopep8_cmd="/home/guillaume/.local/bin/autopep8"

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END


" Vim HardMode config
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Options
set number
set ttimeoutlen=10
" set relativenumber
" set shiftround

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

set showmatch
set hlsearch
set incsearch
set smartindent
set cindent
set encoding=utf-8

" set scrolloff=20
set laststatus=2

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='base16'

" Color syntaxing via Zenburn
set t_Co=256
colors zenburn

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" XML file settings ---------------------- {{{
augroup filetype_html
    autocmd!
	autocmd BufNewFile,BufRead *.launch,*.ui set filetype=xml
augroup END
" }}}

" Python file settings ---------------------- {{{
augroup filetype_python
    autocmd!
	" Enable folding
	au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix foldlevel=1
    autocmd FileType python nnoremap <leader>r :!python3 %<CR>
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker | setlocal foldlevel=0
augroup END
" }}}

" Markdown file settings ---------------------- {{{
augroup filetype_md
  autocmd!
	autocmd FileType markdown noremap <leader>l :w<bar>!pandoc -so $(echo % \| sed 's/md$/pdf/') % <CR><CR>:!pkill -HUP mupdf<CR><CR>
	autocmd FileType markdown noremap <leader>s :!gnome-open $(echo % \| sed 's/md$/pdf/') & disown<CR><CR>
augroup END
" }}}

" LateX file settings ---------------------- {{{
augroup filetype_latex
	autocmd!
    autocmd FileType tex nnoremap <leader>l :w<bar>!xelatex -shell-escape % <CR><CR>:!pkill -HUP mupdf<CR><CR>
	autocmd FileType tex nnoremap <leader>f :call FoldColumnToggle()<cr>
	"autocmd FileType tex nnoremap <leader>s :!mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
	autocmd FileType tex nnoremap <leader>s :!gnome-open $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
augroup END
" }}}

" Lilypond file settings ---------------------- {{{
augroup filetype_lilypond
	autocmd!
	au BufNewFile,BufRead *.ly nnoremap <leader>r :!lilypond --pdf %<CR>
augroup END
" }}}

" reStructuredText file settings ---------------- {{{
augroup filetype_rst
	au BufNewFile,BufRead *.rst nnoremap <leader>dr :!rosdoc_lite .<CR>
augroup END
" }}}

" vim file settings ---------------- {{{
" augroup vimrc " Source vim configuration upon save
" 	autocmd!
" 	autocmd BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
" augroup END
" }}}

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" nnoremap <leader>q :call QuickfixToggle()<cr>
" 
" let g:quickfix_is_open = 0
" 
" function! QuickfixToggle()
"     if g:quickfix_is_open
"         cclose
"         let g:quickfix_is_open = 0
"         execute g:quickfix_return_to_window . "wincmd w"
"     else
"         let g:quickfix_return_to_window = winnr()
"         copen
"         let g:quickfix_is_open = 1
"     endif
" endfunction
" 
" function! WC()
"     let filename = expand("%")
"     let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
"     let result = system(cmd)
"     echo result . " words"
" endfunction
" 
" command! WC call WC()

" NERDTree
"
" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd FileType NERDTree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd FileType NERDTree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('py'   , 'yellow' , 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('jade'  , 'green'  , 'none', 'green'  , '#151515')
" call NERDTreeHighlightFile('ini'   , 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('md'    , 'blue'   , 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml'   , 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('config', 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('conf'  , 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('json'  , 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('html'  , 'yellow' , 'none', 'yellow' , '#151515')
" call NERDTreeHighlightFile('styl'  , 'cyan'   , 'none', 'cyan'   , '#151515')
" call NERDTreeHighlightFile('css'   , 'cyan'   , 'none', 'cyan'   , '#151515')
" call NERDTreeHighlightFile('coffee', 'Red'    , 'none', 'red'    , '#151515')
" call NERDTreeHighlightFile('js'    , 'Red'    , 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php'   , 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('cpp'   , 'Red'    , 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('tex'   , 'yellow' , 'none', '#ff00ff', '#151515')

" autocmd vimenter * NERDTree " Load at vim startup
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" let NERDTreeIgnore=['\.o$', '\.pyc']

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:languagetool_jar = "/home/guillaume/.vim/LanguageTool/languagetool-commandline.jar"

"let g:UltiSnipsSnippetsDir="/home/guillaume/.vim/UltiSnips"

"let g:skk_initial_mode = 'hira'
"let g:skk_script = '~/.vim/skk/skk.vim/plugin/skk.vim'

"automatic grep
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
