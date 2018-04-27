setlocal shiftwidth=4
setlocal tabstop=4

" Remove trailing spaces on saving
autocmd BufWritePre <buffer> Despace

" Easy way to enter en empty docstring
nnoremap <leader>" i""""""<esc>3ha
inoremap <leader>" """"""<esc>3ha

" " from the Google style guide (https://google.github.io/styleguide/pyguide.html)
" " Indent Python in the Google way.
