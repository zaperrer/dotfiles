# ================= Plugins =================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZP::brew
zi snippet OMZP::git
zi snippet OMZL::history.zsh
zi load fdellwing/zsh-bat
zi load MichaelAquilina/zsh-you-should-use
zi load ajeetdsouza/zoxide
zi load chrissicool/zsh-256color # Desired by autosuggestions
zi ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'; zi light sindresorhus/pure
zi ice depth=1; zi light jeffreytse/zsh-vi-mode
zi light Aloxaf/fzf-tab
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions
zi ice wait lucid atinit'zpcompinit; zpcdreplay'; zi light zdharma-continuum/fast-syntax-highlighting
zi ice wait'1' lucid; zi light mattberther/zsh-pyenv
zi ice wait'1' lucid; zi light laggardkernel/zsh-thefuck

# ================= Aliases =================
alias_path="${HOME}/.zsh_aliases"
[[ -f "$alias_path" ]] && source "$alias_path"

# ================= Settings =================

# Editor
EDITOR=vim
VISUAL=vim
PAGER=cat

# Completion
setopt auto_cd

# History
bindkey '^R' history-incremental-search-backward

# zsh-autosuggestions
bindkey '^F' autosuggest-execute

# # ================= Brew =================
export HOMEBREW_NO_ENV_HINTS=1

return 0
