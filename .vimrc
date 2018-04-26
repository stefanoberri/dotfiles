" NOTES for rarely used commands
"
" :resize 60
" :vertiacal resize 60
" resize panes to specifided hight/width (60)
"
" if number has + or - sign (i.e. +12) it adds/subtract that to current size
"
" Ctrl-w N+  Ctrl-w N-  Ctrl-w N>  Ctrl-w N<
" increase horizontally, decrease horizontally, increase vertically, decrease
" vertically the window N lines
"
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



" Vundle specific settings -----------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Mini buff Explorer
Plugin 'fholgado/minibufexpl.vim'
" Syntastic
Plugin 'scrooloose/syntastic'
" Nerdtree
Plugin 'scrooloose/nerdTree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" To install from command line: vim +PluginInstall +qall
" End of Vundle ------------------
"
" ==== PLUGIN SETTINGS =============
"
" == MiniBufExpl settings ==============
"
" Mappings to move between buffers when using minibufexpl
" https://github.com/fholgado/minibufexpl.vim
" next (numerically)
" map <C-a>l :MBEbn<CR>
nnoremap <C-l> :MBEbn<CR>
" previous (numerically)
" map <C-a>h :MBEbp<CR>
nnoremap <C-h> :MBEbp<CR>
" next (historically)
" map <C-a>j :MBEbf<CR>
nnoremap <C-j> :MBEbf<CR>
" previous (historically)
" map <C-a>k :MBEbb<CR>
nnoremap <C-k> :MBEbb<CR>
" = Colors ===

" == Syntastic settings ==============
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set Python checker with flake8 and pylint. Either must be installed in
" default python to enable syntax checks
let g:syntastic_python_checkers = ['flake8', 'pylint']

" == NERDTree settings ===============
" Map F2 to toggle NERDTree. Resize vertical split with Ctrl-w =
silent! nnoremap <F2> :NERDTreeToggle<CR><C-w>=
" Map F3 to find file in NERDTree. Resize vertical split with Ctrl-w =
silent! nnoremap <F3> :NERDTreeFind<CR><C-w>=



" == Settings ==

" Set the leader
:let mapleader = ","

" add numbers on the left
set nu

" add ruler with information about cursor position
set ruler

" don't highlight after searches
set hls!


" use indents of 2 spaces. Keep these commands together as they should be
" changed at once. See :help tabstop
" tab are actually spaces (type Ctrl-V<Tab> to insert a real tab and use
" command :retab to change all existing tab to the new style
" to remove the tab conversion enter ':set noexpandtab'

set shiftwidth=2 softtabstop=2 tabstop=8 noexpandtab
" set shiftround

set autoindent

" don't make it look like there are line breaks where there aren't:
set nowrap

" normally don't automatically format `text' as it is typed, IE only do this
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

" set search case insensitive (to put it back case sensitive type
" set noignorecase
set ignorecase

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


" set a nice colorsheme for a dark background
colorscheme elflord

" for a bright background this would be better
" colorscheme slate

" Activate syntax autocpmpletion (Ctrl-n)
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Allow hidden buffers
" A hidden buffer is a buffer with some unsaved modifications and is not
" displayed in a window.
set hidden

" Easy split
noremap \| :vsplit<CR>
noremap _ :split<CR>

" deactivate search highlighting
set nohlsearch

"" COMMENTING in a few languages (highlight in visual mode and then type the
" combination    ,#
"
" ,# perl # comments
noremap <leader># :s/^/# /<CR>
noremap <leader>@ :s/\(\s\+\)/\1# /<CR>
" now remove them
noremap <leader>,# :s/^# //<CR>
noremap <leader>,' :s/\(\s\+\)# /\1/<CR>

" ,% latex/matlab % comments
noremap <leader>% :s/^/% /<CR><Esc>:nohlsearch<CR>
noremap <leader>,% :s/^% //<CR>
"
" ,/ C/C++/C#/Java // comments
noremap <leader>/ :s/^/\/\/ /<CR><Esc>:nohlsearch<CR>
noremap <leader>,/ :s/^\/\/ //<CR>
"
" ,< HTML comment
noremap <leader>< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
noremap <leader>,< :s/^<!-- \(.*\) -->/\1/<CR><Esc>:nohlsearch<CR>
"
" c++ java style comments
noremap <leader>* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>
noremap <leader>,* :s/^\/\* \(.*\) \*\/$/\1/<CR>

" re-sync syntax highlighting
map <leader>,<CR> <Esc>:syntax sync fromstart<CR>

""" CUSTOM COMMANDS
command Spell execute "set spell spelllang=en_gb"
command Nospell execute "set nospell"
command CB execute ":MBEbd"

command Despace execute "%s/\\s\\+$//ge"
""" INSERT DATE
" from http://henry.precheur.org/scratchpad/
function s:InsertISODate()
    let timestamp = strftime('%Y-%m-%d')
    execute ":normal i" . timestamp
    echo 'New time: ' . timestamp
endfunction

function s:InsertISODatetime()
    let timestamp = strftime('%Y-%m-%d %H:%M:%S')
    execute ":normal i" . timestamp
    echo 'New time: ' . timestamp
endfunction

command Day   call s:InsertISODate()
command Now   call s:InsertISODatetime()

""" MOVING AROUND
" page down with <Space> (like in `Pine', `Less', and `More');
" page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'): don't like this anymore.
noremap <Space> <PageDown>
" noremap <BS> <PageUp>
noremap - <PageUp>

" makes hjkl also work in insert mode with ctrl
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-j> <Up>
imap <C-k> <Down>

" to work nicely with tmux

" map C 0i#[CTRL]-ESC j
" The previous do not know exactly what it does


" option to set the backspace to work (delete) in cygwin
set backspace=2
