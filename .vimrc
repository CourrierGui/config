set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Mappings
let mapleader = ","
let localmapleader = "\\"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" SimpylFold
let g:SimpylFold_docstring_preview=1

" NERDTree
autocmd vimenter * NERDTree " Load at vim startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('cpp', 'Red', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('tex', 'yellow', 'none', '#ff00ff', '#151515')

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" Enable folding with the spacebar
nnoremap <space> za

" Color syntaxing
let python_highlight_all=1
syntax on

"Editing and sourcing ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR><c-w>h12G$
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>x xp
nnoremap H 0
nnoremap L $
vnoremap <leader>q `><esc>i"<esc>v`<<esc>i"<esc>v

noremap <leader>- dd2kp
noremap <leader>_ ddp
nnoremap <enter> o<esc>
inoremap <c-u> <esc>veU<esc>ea
nnoremap <c-u> veU<esc>
inoremap <c-d> <esc>ddi

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set showmatch
set hlsearch
set incsearch
set scrolloff=20
set laststatus=2

" Color syntaxing via Zenburn
set t_Co=256
colors zenburn

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"let g:syntastic_always_populate_loc_list = 1
"let g:languagetool_jar = "/home/guillaume/.vim/LanguageTool/languagetool-commandline.jar"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"let g:UltiSnipsSnippetsDir="/home/guillaume/.vim/UltiSnips"

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"set empty latex file to tex snips
"let g:tex_flavor = "latex"

"let g:skk_initial_mode = 'hira'
"let g:skk_script = '~/.vim/skk/skk.vim/plugin/skk.vim'

"automatic grep
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" XML file settings ---------------------- {{{
augroup filetype_html
    autocmd!
	autocmd BufNewFile,BufRead *.launch *.ui set filetype=xml
augroup END
" }}}
"
" Python file settings ---------------------- {{{
augroup filetype_python
    autocmd!
	" Enable folding
	au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix foldlevel=99 foldmethod=indent
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
	autocmd FileType markdown noremap <leader>s :!mupdf $(echo % \| sed 's/md$/pdf/') & disown<CR><CR>
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

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction


nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
















