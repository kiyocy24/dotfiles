if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt pure

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='nvim'
alias vim='nvim'
alias t='tmux'

alias gst='git status'
alias gca='git commit --amend'

unsetopt correct

function move_to_repository() {
   cd $(ghq list -p --vcs=git | fzf --reverse)
   zle reset-prompt
}
zle -N move_to_repository
bindkey '^q' move_to_repository

eval "$(direnv hook zsh)"
export EDITOR=vim
# history search
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000        # メモリ上の履歴リストに保存されるイベントの最大数
export SAVEHIST=100000        # 履歴ファイルに保存されるイベントの最大数

setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups   # 履歴が重複した場合に古い履歴を削除する
setopt hist_ignore_dups       # 前回のイベントと重複する場合、履歴に保存しない
setopt hist_save_no_dups      # 履歴ファイルに書き出す際、新しいコマンドと重複する古いコマンドは切り捨てる
setopt share_history          # 全てのセッションで履歴を共有する

zle -N select-history       # ZLEのウィジェットとして関数を登録
bindkey '^r' select-history # `Ctrl+r` で登録したselect-historyウィジェットを呼び出す

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}
# zsh notify
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "marzocchi/zsh-notify"
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load
zstyle ':notify:*' success-sound "Pop"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiyoshi.kanazawa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiyoshi.kanazawa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiyoshi.kanazawa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiyoshi.kanazawa/google-cloud-sdk/completion.zsh.inc'; fi

# Go
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

# kustomize
export PATH=$HOME/go/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# merc
export PATH=$HOME/ghq/github.dena.jp/Ryu/ryu-merge-cli:$PATH

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export GEM_HOME=~/.ruby/
export PATH="$PATH:~/.ruby/bin"

ssh-add ~/.ssh/id_rsa


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# dgpm
export PATH="/Users/kiyoshi.kanazawa/.dgpm/darwin-amd64/bin:$PATH"

# protocenv
export PATH=$HOME/.local/bin:$PATH

# aqua
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml

# gnu
# export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# personal access token
export GITHUB_TOKEN=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
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
