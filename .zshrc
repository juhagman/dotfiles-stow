echo zshrc

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PROMPT="%B%n@%m %1~ %#%b "
export EDITOR="nvim"

# add brew to path
export PATH="/opt/homebrew/bin:$PATH"

# add magic to path
export PATH="$HOME/.modular/bin:$PATH"

# add local bin to path
export PATH="$HOME/bin:$PATH"

# Colors
if [ `~/bin/is-dark.sh` = true ]; then 
  export LSCOLORS=GxFxCxDxBxegedabagaced
fi

# import work stuff if exists
[ -f ~/zsh_hublet ] && source ~/zsh_hublet

# history
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst

# command aliases
alias ls_time='ls -lt'
alias ls="ls -G"
alias yle-dl="docker run --rm -ti -u=$(id -u):$(id -g) -v "$(pwd)":/out taskinen/yle-dl" 

function locate {
  mdfind -onlyin `pwd` "kMDItemDisplayName == $1"
}

function mman {
  man -t $1 | open -fa Preview 
}

# Docker
alias dockviz="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias docker_images_tree="dockviz images -d | dot -Tpng -o images.png && open images.png"

# Libressl (for mostly vapor)
export PATH="/opt/brew/opt/libressl/bin:$PATH"
export LDFLAGS="-L/opt/brew/opt/libressl/lib"
export CPPFLAGS="-I/opt/brew/opt/libressl/include"
export PKG_CONFIG_PATH="/opt/brew/opt/libressl/lib/pkgconfig"

# Brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

