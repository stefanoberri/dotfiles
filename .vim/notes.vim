so $HOME/.vimrc

" vim-notes settings
let g:notes_directories = [$NOTEHOME]

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * Note notes
