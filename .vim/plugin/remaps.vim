""" All remaps are here

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

function Quality()
let save_view = winsaveview()
  Isort
  Black
call winrestview(save_view) " return to previous view
endfunction
" code quality - Python. iSort and Black
nnoremap <leader>q :call Quality() <cr>


" Easy split
noremap \| :vsplit<CR>
noremap _ :split<CR>

" Disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" re-sync syntax highlighting
nnoremap <leader><leader><CR> <Esc>:syntax sync fromstart<CR>

