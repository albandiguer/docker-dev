""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETION CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['tsserver', 'tslint'],
			\ }

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'markdown': ['prettier'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
