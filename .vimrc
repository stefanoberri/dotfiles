" NOTES for rarely used commands

" :resize 60
" :vertical resize 60
" resize panes to specified hight/width (60)

" if number has + or - sign (i.e. +12) it adds/subtract that to current size

" Ctrl-w N+  Ctrl-w N-  Ctrl-w N>  Ctrl-w N<
" increase horizontally, decrease horizontally, increase vertically, decrease
" vertically the window N lines

" SPELLING
" https://www.linux.com/learn/using-spell-checking-vim
" activate spelling highlight
" :set spell spelllang=en_gb
" in command mode type [s  and ]s for previous and next word. Type z= for a
" list of suggestions and zg to add a word to a dictionary, zw for marking it a
" wrong
" Remove spelling highlight
" :set nospell
" Set spelling for this buffer only
" :setlocal spell spelllang=en_gb



" settings required bu Vundle to manage plugins
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Activate and configure plugins
source .plugins_vimrc


" Move across buffers
" next buffer
nnoremap <C-l> :bn<CR>
" previous buffer
nnoremap <C-h> :bp<CR>
" first buffer
nnoremap <C-j> :bf<CR>
" last buffer
nnoremap <C-k> :blast<CR>

" quick edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
" quick source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>


" add number and relative numbers on the left
set nu
set relativenumber " disable with :set nornu

" don't highlight after searches
" set hls!
" but highlight the first match
set incsearch
" deactivate search highlighting
set nohlsearch


" uses indents of 2 spaces. Keep these commands together as they should be
" changed at once. See :help tabstop for suggestion of working combinations
" tab are actually spaces (type Ctrl-V<Tab> to insert a real tab and use
" command :retab to change all existing tab to the new style
" to remove the tab conversion enter ':set noexpandtab'

set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
" set shiftround

set autoindent

" don't make it look like there are line breaks where there aren't:
set nowrap

" normally don't automatically format `text' as it is typed, i.e. only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79
" to disable wrapping
" set tw=0


" highlight syntax
syntax on
filetype on

""" Filetype specific
" cwl files have same syntax highlightinh than yaml files
au BufNewFile,BufRead *.cwl set filetype=yaml
" eb files have same syntax highlightinh than py files
au BufNewFile,BufRead *.eb set filetype=python
" nf and config files are groovy files
au BufNewFile,BufRead *.nf set filetype=groovy
au BufNewFile,BufRead *.config set filetype=groovy

" set search case sensitive
" set noignorecase
" set search case insensitive untill a capital letter is used. still use \c
" and \C for forcing case insesitive or case sensitive searches
set smartcase
" to put it back case sensitive type
" set ignorecase

" give special character
set listchars=eol:$,tab:¬·,trail:␣,extends:>,precedes:<

" uses syntax to perform folding (zc and zo to Close or Open folding
" here for more details on folding
" http://www.vim.org/htmldoc/fold.html#fold-commands
"
" TO DISABLE
" set nofoldenable
"
" set foldmethod=syntax
" if you indent correctly the following migh be more useful
set foldmethod=indent
" do not open files already folded
set nofoldenable


" set a nice colorsheme for a dark background
set background=dark
colorscheme elflord

" for a bright background this would be better
" colorscheme slate

" Activate syntax autocpmpletion (Ctrl-n)
set omnifunc=syntaxcomplete#Complete

" Allow hidden buffers
" A hidden buffer is a buffer with some unsaved modifications and is not
" displayed in a window.
set hidden

" Easy split
noremap \| :vsplit<CR>
noremap _ :split<CR>

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" re-sync syntax highlighting
nnoremap <leader><leader><CR> <Esc>:syntax sync fromstart<CR>

" Remove trailing spaces on saving.
autocmd BufWritePre <buffer> Despace

""" CUSTOM COMMANDS
command! Spell execute "set spell spelllang=en_gb"
command! Nospell execute "set nospell"

command! Despace execute "%s/ \\+$//ge"

" option to set the backspace to work (delete) in cygwin
set backspace=2

""" Graphical settings
set guifont=Monaco:h14
