""" Most configurations is in .vim/plugin/*.vim to keep it tidy


" look for last search in files under git
nnoremap <F4> :vimgrep //g `git ls-files` <Bar> cw<CR>
" look for last search in files under git
" nnoremap <F5> :execute " vimgrep /" . expand("<cword>") . "/g `git ls-files`" <Bar> cw



" highlight syntax
syntax on
filetype on

""" Functions
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

""" Autocommands

augroup CLEANUP
  autocmd!
  " Remove trailing spaces from all files before writing
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

""" Filetype specific
" cwl files have same syntax highlightinh than yaml files
autocmd  BufNewFile,BufRead *.cwl set filetype=yaml
" eb files have same syntax highlightinh than py files
autocmd  BufNewFile,BufRead *.eb set filetype=python
" nf and config files are groovy files
autocmd  BufNewFile,BufRead *.nf set filetype=groovy
autocmd  BufNewFile,BufRead *.config set filetype=groovy


""" CUSTOM COMMANDS
command! Spell execute "set spell spelllang=en_gb"
command! Nospell execute "set nospell"


" Activate and confugure plugins
" see :h vundle for more details or wiki for FAQ
" To install from command line: vim +PluginInstall +qall
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " Syntastic (:help syntastic-commands). Allow live syntax checking
" Plugin 'scrooloose/syntastic'

" switchboard for plugins
let enable_abolish=0
let enable_apprentice=1
let enable_black=1
let enable_comment_code=1
let enable_ctags=1
let enable_fugitive=1
let enable_gitgutter=1
let enable_isort=1
let enable_nerdtree=1
let enable_repeat=1
let enable_unimpaired=1
let enable_status_line=1
let enable_surround=1
let enable_vimwiky=1



if enable_nerdtree
  " Nerdtree. Browse files in navigation pane.
  Plugin 'scrooloose/nerdTree'
  " settings
  " Map F2 to toggle NERDTree. Resize vertical split with Ctrl-w =
  silent! nnoremap <F2> :NERDTreeToggle<CR><C-w>=
  let NERDTreeShowHidden=1 " See dotfiles
endif

if enable_gitgutter
  " vim-gitgutter. Show git changes (+/-/~) on the side
  Plugin 'airblade/vim-gitgutter'
  nnoremap <F7> :GitGutterToggle<CR>
endif

" Automate ctags generation
if enable_ctags && executable("ctags")
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-easytags'
  set tags=./.sberri_tags;
  let g:easytags_dynamic_files = 2
  let g:easytags_events = ['BufWritePost']
endif

" " Tagbar to better navigate the code in a side pane
" Plugin 'majutsushi/tagbar'

" Black, a non compromising python code formatter. Only activate if
" requirements are met
if enable_black && v:version > 700 && has('python3') && executable('black')
  " Plugin 'ambv/black'
  Plugin 'psf/black'
endif

" iSort to sort import in Python. Only activate if
" requirements are met
if enable_isort && v:version > 700 && has('python3') && executable('isort')
  Plugin 'fisadev/vim-isort'
  let g:vim_isort_python_version = 'python3'
endif

if enable_fugitive
  " fugitive.vim - git integration
  Plugin 'tpope/vim-fugitive'
endif


if enable_comment_code
  " Comment code
  Plugin 'tpope/vim-commentary'
endif

if enable_surround
  " Surround text with paretheses, quotes, tags and so on
  Plugin 'tpope/vim-surround'
endif

if enable_repeat
  " The . command works with plugins too
  Plugin 'tpope/vim-repeat'
endif

if enable_unimpaired
  " Consistent way to cycle
  Plugin 'tpope/vim-unimpaired'
endif
if enable_abolish
  " Intelligent substitutions
  Plugin 'tpope/vim-abolish'
endif

if enable_status_line
  " Add the status line
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " Install powerline fonts following instructions here
  " https://github.com/powerline/fonts
  let g:airline_powerline_fonts = 1
  let g:airline_theme='bubblegum'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#syntastic#enabled = 0
  let g:airline#extensions#keymap#enabled = 0
  let g:airline#extensions#vista#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0
endif

if enable_vimwiky
  " VimWiki
  Plugin 'vimwiki/vimwiki'
endif

if enable_apprentice
  Plugin 'romainl/Apprentice'
endif

Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
" End of Vundle ------------------
