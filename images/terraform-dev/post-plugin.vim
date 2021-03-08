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


" Terraform Autocompletion
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()
