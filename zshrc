# Prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*' formats "[%b%m%u%c]"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{red}?%f'
  fi
}
precmd() { vcs_info }
PROMPT='%B%2~%b${vcs_info_msg_0_}%# '

# Colours
autoload -U colors
colors

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Use emacs-style keybindings
bindkey -e

# Improved CD options
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Extended globbing
setopt extendedglob

# Disable nomatch warning
unsetopt nomatch

# Completion
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs true

# c() - jump to code directory
c() {
  cd ~/Code/$1
}
compctl -/ -W ~/code c

# Editors
export VISUAL=nvim
export EDITOR=$VISUAL

# Path (deduplicated)
PATH="$HOME/bin:$PATH"
export -U PATH

# Load aliases
source "$HOME/.aliases"

# Load platform-specific settings
if [ -f ".zshrc_platform" ]; then
  source "$HOME/.zshrc_platform"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
