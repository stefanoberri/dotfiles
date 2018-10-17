so $HOME/.vimrc

set background=light
colorscheme slate

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * Note entrynote


" vim-notes settings
let g:notes_directories = [$NOTEHOME]
