set nocompatible              " be iMproved, required
filetype off                  " required

"Mappings
let mapleader = ","
let localmapleader = "\\"

"Editing and sourcing ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR><c-w>h12G$
nnoremap <leader>sv :source $MYVIMRC<CR>

"inoremap jk <esc>
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


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'file:///home/guillaume/.vim/bundle/Auto-Pairs'
Plugin 'file:///home/guillaume/.vim/bundle/a.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tyru/skk.vim'
Bundle 'ervandew/supertab'


"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set number
set relativenumber
set tabstop=4
set shiftwidth=4
set showmatch
set hlsearch
set incsearch
set scrolloff=20
"nnoremap <esc> :noh<return><esc>

let g:syntastic_always_populate_loc_list = 1



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="/home/guillaume/.vim/UltiSnips"


let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"set empty latex file to tex snips
let g:tex_flavor = "latex"

let g:skk_initial_mode = 'hira'
let g:skk_script = '~/.vim/skk/skk.vim/plugin/skk.vim'

set completeopt=menuone,preview
"set thesaurus=~/vim/skk/skk-jisyo-utf-8.l
set thesaurus=~/.vim/skk/japanese-dict

function! ToogleMode()
	if 'hira' ==# g:skk_initial_mode
		let g:skk_initial_mode = 'kata'
	else
		let g:skk_initial_mode = 'hira'
	endif
	execute "source " . g:skk_script
endfunction

set nofoldenable
set laststatus=2

"Setting syntax color and auto indent for .launch files
augroup filetype_html
    autocmd!
	autocmd BufNewFile,BufRead *.launch set filetype=xml
augroup END

"automatic grep
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>


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
	autocmd FileType tex nnoremap <leader>s :!mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
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
















