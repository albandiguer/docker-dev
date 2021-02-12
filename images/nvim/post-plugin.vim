
" Load colors! On the initial install this will error out, so make it silent
" so it installs without issues.
silent! colorscheme coffee
" use the current background's color to clear the screen.
set t_ut=

" Use spaces instead just for yaml
autocmd Filetype yaml setl expandtab

" Enable spell checking for markdown files
autocmd Filetype markdown setl spell

" Force the emoji to show up in the completion dropdown
let g:github_complete_emoji_force_available = 1

" Make custom github domains configurable
let g:fugitive_github_domains = ['github.com']
if ! empty($GITHUB_ENTERPRISE_DOMAINS)
	call extend(g:fugitive_github_domains, split($GITHUB_ENTERPRISE_DOMAINS, ','))
end

" skip certain file types
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" point to c implementation of editorconfig
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE syntax checkers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_completion_delay=200
let g:ale_completion_enabled = 0
let g:ale_echo_cursor = 0 " fasten things a lot (see vim profile)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--no-semi --single-quote'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_delay = 200 " (in ms)
let g:ale_lint_on_enter = 0 " on opening a file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_open_list=0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠ '
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'python': ['flake8'],
      \ 'sql': ['sqlint'],
      \ 'terraform': ['tflint']
      \ }
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'haskell': ['brittany'],
      \ 'python': ['black'],
      \ 'sql': ['sqlfmt'],
      \ 'terraform': ['fmt'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:ale_python_black_options = '--line-length 79' " line length 88 by default


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>b :Buffers<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufonly config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ' :Bonly<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag the silver searcher
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change the default engine for search
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  let g:grep_cmd_opts = '--line-numbers --noheading'
  let g:ackprg = 'ag --vimgrep'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
endif"

nnoremap K :Ack! "\b<cword>\b" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" close vim if only open window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
