" Config env linters/fixers
let g:ale_terraform_tflint_executable='tflint'
let g:ale_linters = {
      \ 'terraform': ['tflint']
      \ }
let g:ale_fixers = {
      \ 'terraform': ['terraform'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:syntastic_terraform_tffilter_plan = 1
