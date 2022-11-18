""" Set options

" add number and relative numbers on the left
set number
set relativenumber

" deactivate search highlighting
set nohlsearch
" but highlight the first match
set incsearch

" uses indents of 2 spaces. Keep these commands together as they should be
" changed at once. See :help tabstop for suggestion of working combinations
" tab are actually spaces (type Ctrl-V<Tab> to insert a real tab and use
" command :retab to change all existing tab to the new style
" to remove the tab conversion enter ':set noexpandtab'
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set autoindent

" don't make it look like there are line breaks where there aren't:
set nowrap

" disable modeline
set nomodeline

" " to disable text formatting, uncomment the followin
" set formatoptions-=t
" set textwidth=79

" " to disable wrapping
" set tw=0


" set search case sensitive
" set noignorecase
" set search case insensitive untill a capital letter is used. still use \c
" and \C for forcing case insesitive or case sensitive searches
set smartcase
" to put it back case sensitive type :set ignorecase

" give special character
set listchars=eol:$,tab:¬·,trail:␣,extends:>,precedes:<

" uses syntax to perform folding (zc and zo to Close or Open folding
" here for more details on folding
" http://www.vim.org/htmldoc/fold.html#fold-commands
"
" TO DISABLE
" set nofoldenable

" if you indent correctly the following migh be more useful
set foldmethod=indent
" do not open files already folded
set nofoldenable


" set a nice colorsheme for a dark background
" for a bright background this would be better
" colorscheme slate
set background=dark
" The background color is the same as the terminal
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

if &diff
    syntax off
    colorscheme apprentice
else
    colorscheme torte
endif

" Activate syntax autocpmpletion (Ctrl-n)
set omnifunc=syntaxcomplete#Complete

" Allow hidden buffers
" A hidden buffer is a buffer with some unsaved modifications and is not
" displayed in a window.
set hidden


" option to set the backspace to work (delete) in cygwin
set backspace=2

""" Graphical settings
set guifont=Monaco:h14

