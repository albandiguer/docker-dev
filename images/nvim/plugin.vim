Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace' "Strip white spaces
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dense-analysis/ale' " Syntax checker https://vimawesome.com/plugin/ale
Plug 'christoomey/vim-tmux-navigator' "navigate seamlessly between vim and tmux
Plug 'Raimondi/delimitMate' " Close parenthesis quotes etc
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy search

Plug 'schickling/vim-bufonly' "Close inactive buffers
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'typescript', 'javascript.jsx']}
Plug 'tmhedberg/matchit' " Jump to end of block
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'scrooloose/nerdtree'
Plug 'mattn/webapi-vim' " Auth in vim, used by gist-vim
Plug 'mattn/gist-vim'

Plug 'lodestone/lodestone.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
Plug 'junegunn/vim-slash' " Automatically clear search highlight
