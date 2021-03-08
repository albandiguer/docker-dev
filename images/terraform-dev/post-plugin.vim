" Config env linters/fixers
" let g:ale_terraform_tflint_executable='tflint'
let g:ale_linters = {
      \ 'terraform': ['tflint']
      \ }
let g:ale_fixers = {
      \ 'terraform': ['terraform'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETION CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['tsserver', 'tslint'],
      \ 'terraform': ['tflint']
			\ }

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'terraform': ['terraform'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
