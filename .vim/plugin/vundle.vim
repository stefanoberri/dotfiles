" Configurations realted to vim plugins: Installing, managing and configuring.
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

""""""""""""""""
" Installation "
""""""""""""""""
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
" " settings
" " set statusline+=%#warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
" " set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_pylint_args = "--disable=print-statement"
" " let g:syntastic_python_pylint_rcfile='/Users/sberri/.pylintrc'
" " Set Python checker with pylint. Must be installed in default python to enable
" " syntax checks
" let g:syntastic_python_checkers = ['pylint']
" " Do not activate syntax checking by default
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <leader>j :lnext<CR>
" nnoremap <leader>k :lprevious<CR>
" " Activate syntax checking with <Ctrl-w>e (need to write file to run the
" " linter. :SyntasticCheck strangely opens a window
" nnoremap <C-w>e :SyntasticToggleMode<CR>

" Nerdtree. Browse files in navigation pane.
Plugin 'scrooloose/nerdTree'
" settings
" Map F2 to toggle NERDTree. Resize vertical split with Ctrl-w =
silent! nnoremap <F2> :NERDTreeToggle<CR><C-w>=
" Map F3 to find file in NERDTree. Resize vertical split with Ctrl-w =
silent! nnoremap <F3> :NERDTreeFind<CR><C-w>=
let NERDTreeShowHidden=1 " See dotfiles

" vim-gitgutter. Show git changes (+/-/~) on the side
Plugin 'airblade/vim-gitgutter'
" gitgutter settings
nnoremap <F7> :GitGutterToggle<CR>

" " Automate ctags generation
" if executable("ctags")
"   Plugin 'xolox/vim-misc'
"   Plugin 'xolox/vim-easytags'
"   " == EasyTags settings ==
"   set tags=./tags;
"   let g:easytags_dynamic_files = 1
" endif

" " Tagbar to better navigate the code in a side pane
" Plugin 'majutsushi/tagbar'
" " == Tagbar settings  ==============
" nnoremap <F8> :TagbarToggle<CR>
" nnoremap <F9> :TagbarOpen j<CR>


" Black, a non compromising python code formatter. Only activate if
" requirements are met
if v:version > 700 && has('python3') && executable('black')
  Plugin 'ambv/black'
  " settings
  " let g:black_linelength=88
endif

" fugitive.vim - git integration
Plugin 'tpope/vim-fugitive'

" Comment code
Plugin 'tpope/vim-commentary'

" Surround text with paretheses, quotes, tags and so on
Plugin 'tpope/vim-surround'

" The . command works with plugins too
Plugin 'tpope/vim-repeat'

" Intelligent substitutions
Plugin 'tpope/vim-abolish'

" Add the status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" settings
" Install powerline fonts following instructions here
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#vista#enabled = 0
let g:airline#extensions#whitespace#enabled = 0


" VimWiki
Plugin 'vimwiki/vimwiki'

Plugin 'romainl/Apprentice'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" End of Vundle ------------------

