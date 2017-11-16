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


" add numbers on the left
set nu

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
" a slighly modified elflord  colorscheme
" colorscheme stefano
" dowloaded from
" https://bitbucket.org/jasonwryan/centurion/src/aec27bb5dab4/.vim/colors?at=default
" colorscheme miro8

" for a bright background this would be better
" colorscheme slate

" Activate syntax autocpmpletion (Ctrl-n)
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" if not present, add plugin from
" https://github.com/fholgado/minibufexpl.vim
map <F2>n :MBEbn<CR>
map <F2>p :MBEbp<CR>
map <F2>f :MBEbf<CR>
map <F2>b :MBEbb<CR>
map \| :vsplit<CR>
map _ :split<CR>




"" COMMENTING in a few languages (highlight in visual mode and then type the
" combination    ,#
"
" ,# perl # comments
map ,# :s/^/# /<CR>
map ;# :s/\(\s\+\)/\1# /<CR>
" now remove them
map ,,# :s/^# //<CR>
map ;;# :s/\(\s\+\)# /\1/<CR>

" deactivate search highlighting
" https://stackoverflow.com/questions/99161/how-do-you-make-vim-unhighlight-what-you-searched-for
set nohlsearch

" <Esc>:nohlsearch<CR>
"
" ,% latex/matlab % comments
map ,% :s/^/% /<CR><Esc>:nohlsearch<CR>
"
" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\/ /<CR><Esc>:nohlsearch<CR>
"
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
"
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

" iunmap \c
map ,,<CR> <Esc>:syn sync fromstart<CR>

""" CUSTOM COMMANDS
command Spell execute "set spell spelllang=en_gb"
command Nospell execute "set nospell"

command Despace execute "%s/\\s\\+$//g"
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
set nocompatible
set backspace=2

if exists(":pathogen")
  execute pathogen#infect()
endif

