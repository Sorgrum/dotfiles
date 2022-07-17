#           Personal .zshrc file of Marcelo Gheiler <me@marcelogheiler.com>
#

# Setup {{{
# ==============================================================================
    # Custom function to run when `cd`ing
    auto-ls-exa () {
      exa -l --git
    }

# Plugins {{{
# ==============================================================================
    source <(antibody init)

    export FZF_BASE=~/.local/share/nvim/site/plugins/fzf

    # Setup required env var for oh-my-zsh plugins
    export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

    # Speed up nvm load
    export NVM_LAZY_LOAD=true
    
    antibody bundle desyncr/auto-ls
    antibody bundle caarlos0/zsh-open-github-pr
    antibody bundle ohmyzsh/ohmyzsh path:plugins/extract
    antibody bundle ohmyzsh/ohmyzsh path:plugins/dirhistory
    antibody bundle ohmyzsh/ohmyzsh path:plugins/fzf
    antibody bundle ohmyzsh/ohmyzsh path:plugins/sudo
    antibody bundle zpm-zsh/ssh
    antibody bundle Aloxaf/fzf-tab
    antibody bundle mdumitru/fancy-ctrl-z
    antibody bundle zdharma-continuum/fast-syntax-highlighting
    antibody bundle lukechilds/zsh-nvm
    antibody bundle zsh-users/zsh-autosuggestions
    antibody bundle zsh-users/zsh-completions
    antibody bundle dracula/zsh
    autoload -Uz compinit && compinit

    # Auto load env variables when entering a new dir
    eval "$(direnv hook zsh)"

# Configuration {{{
# ==============================================================================

    COMPLETION_WAITING_DOTS='true'
    DISABLE_UPDATE_PROMPT='true'
    ENABLE_CORRECTION='true'
    HIST_STAMPS='yyyy-mm-dd'
    ZSH_THEME='robbyrussell'

    # Custom prompt
    eval "$(starship init zsh)"

    export GIT_EDITOR=vim
    export EDITOR=vim
    export BROWSER=firefox

    export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"
    export AUTO_LS_COMMANDS=(exa)

    # Silence
    unsetopt BEEP

    # Improve autocompletion style
    zstyle ':completion:*' menu select # select completions with arrow keys
    zstyle ':completion:*' group-name '' # group results by category
    zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

    cmd_found () { command -v "$@" >/dev/null; }
    cmd_not_found() { ! cmd_found "$@"; }

    if cmd_found brew; then
        export GOPATH=$HOME/Development/go
    else
        export GOPATH=$HOME/projects/go
    fi

    path=(
        $HOME/.local/bin
        $HOME/.bin
        $HOME/bin
        $HOME/.go/bin
        $HOME/.yarn/bin
        $HOME/.rbenv/bin
        $HOME/.config/yarn/global/node_modules/.bin
        $GOPATH/bin
        $path
    )

    cdpath=(
        $HOME/projects
        $HOME/Development
    )

    if [ -f ~/.zshrc_local ]; then
        source ~/.zshrc_local
    fi

    eval "$(rbenv init -)"

# Aliases & Functions {{{
# ==============================================================================
    
    # Git
    alias g='git'
    alias gs='git status'
    alias gf='git fetch'
    alias ga='git add'
    alias gc='git commit'

    # File Handling
    alias fd='find . -type d -name'
    alias ff='find . -type f -name'
    alias grep='grep --color'
    alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

    # Global
    alias H='| head'                # Pipes output to head which outputs the first part of a file
    alias T='| tail'                # Pipes output to tail which outputs the last part of a file
    alias G='| grep'                # Pipes output to grep to search for some word
    alias L='| less'                # Pipes output to less, useful for paging
    alias M='| most'                # Pipes output to more, useful for paging
    alias LL='2>&1 | less'          # Writes stderr to stdout and passes it to less
    alias CA='2>&1 | cat -A'        # Writes stderr to stdout and passes it to cat
    alias NE='2 > /dev/null'        # Silences stderr
    alias NUL='> /dev/null 2>&1'    # Silences both stdout and stderr

    # General
    alias cat='bat'
    alias pat='bat -p'
    alias cmd='command'
    alias ls='exa -l --git'
    alias l='command ls -lAFh'
    alias vim='nvim'
    alias ze='vim ~/.zshrc'
    alias zs='source ~/.zshrc'
    alias ssh='et'

    # Development
    alias build="docker compose build"
    alias up="docker compose up"
