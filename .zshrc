#================= Plugins =================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZP::brew
zi snippet OMZP::git
zi snippet OMZL::directories.zsh
zi for \
    atuinsh/atuin \
    fdellwing/zsh-bat \
    gimbo/gimbo-git.zsh \
    MichaelAquilina/zsh-you-should-use \
    ajeetdsouza/zoxide \
    chrissicool/zsh-256color # Desired by autosuggestions
zi light-mode for \
    Aloxaf/fzf-tab \
    z-shell/zsh-eza \
    willghatch/zsh-saneopt \
        depth=1 \
    jeffreytse/zsh-vi-mode \
        as"command" from"gh-r" \
        atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
        atpull"%atclone" src"init.zsh" \
    starship/starship
zi wait'1' lucid for \
    mattberther/zsh-pyenv \
    laggardkernel/zsh-thefuck \
        blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
        atload:_zsh_autosuggest_start \
    zsh-users/zsh-autosuggestions \
        atinit'zpcompinit; zpcdreplay' \
    zdharma-continuum/fast-syntax-highlighting

# ================= Aliases =================
alias "$"="$@" # Pastable code starting with $

# Needed by poetry, maybe..
# fpath+=~/.zfunc

if (( $+commands[nvim] ))
then
    alias n=nvim
    alias vim=nvim
    alias vi=nvim
fi

# ================= Settings =================

# Editor
EDITOR=vim
VISUAL=vim
PAGER=cat

# zsh-autosuggestions
bindkey ';' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^f' vi-forward-word

# # ================= Brew =================
export HOMEBREW_NO_ENV_HINTS=1

return 0
