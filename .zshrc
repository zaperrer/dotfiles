# ================= Aliases =================
alias_path="${HOME}/.zsh_aliases"
[[ -f "$alias_path" ]] && source "$alias_path"
export PATH="$HOME/bin/$:$PATH" # Load stowed binaries

# # ================= Pyenv =================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ================= Plugins =================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit load "agkozak/zsh-z"
zinit load "zpm-zsh/colors" # Better with grc
zinit load "chrissicool/zsh-256color" # Desired by autosuggestions
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zdharma-continuum/fast-syntax-highlighting"
zinit light "mattberther/zsh-pyenv"
zinit load "dracula/zsh"

# ================= Settings =================
setopt correct
setopt interactivecomments
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic; zle -N bracketed-paste bracketed-paste-magic

# Editor
setopt vi
export KEYTIMEOUT=1
EDITOR=vim
VISUAL=vim
PAGER=less
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Completion
autoload -Uz compinit && compinit
setopt complete_in_word
setopt auto_cd

# History
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward

# zsh-autosuggestions
bindkey '^F' autosuggest-execute
ZSH_AUTOSUGGEST_USE_ASYNC='YAAAAASSSSSS'

# Test load time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

return 0
