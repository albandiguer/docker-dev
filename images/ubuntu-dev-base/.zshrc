#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Utility functions
#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

catjson() {
  cat $1 | python -mjson.tool
}

_has_truecolor() {
  awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
    for (colnum = 0; colnum<256; colnum++) {
        r = 255-(colnum*255/255);
        g = (colnum*510/255);
        b = (colnum*255/255);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# aliases, plugins and exports
#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ZSH_THEME='af-magic' # PROTIP list themes: ~/.oh-my-zsh/tools/theme_chooser.sh -s

alias vi='nvim .'
alias vim="nvim"
alias c='clear'
alias g='git'

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export EDITOR='vim'

plugins=(
  colored-man-pages
  docker
  git
)

# All the plugins should go before oh-my-zsh is sourced
source $ZSH/oh-my-zsh.sh
