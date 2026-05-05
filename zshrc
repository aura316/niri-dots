# ------------------------------------------------------------------------------
# Plugin paths
# ------------------------------------------------------------------------------
# Different distros handle paths differently, adjust accordingly
# Requires:
# - zsh-autosuggestions      https://github.com/zsh-users/zsh-autosuggestions
# - zsh-syntax-highlighting  https://github.com/zsh-users/zsh-syntax-highlighting
# - fzf                      https://github.com/junegunn/fzf

Z_SYNTAX_PATH=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
Z_AUTO_SUGGEST_PATH=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
path+=~/.local/bin

# ------------------------------------------------------------------------------
# HISTORY
# ------------------------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

# ------------------------------------------------------------------------------
# COMPLETION SYSTEM
# ------------------------------------------------------------------------------

# Initialize the completion system
autoload -U compinit
compinit

# Group and format completion results
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ------------------------------------------------------------------------------
# KEYBINDINGS
# ------------------------------------------------------------------------------

# Ctrl + Left Arrow → Move backward a word
bindkey '^[[1;5D' backward-word

# Ctrl + Right Arrow → Move forward a word
bindkey '^[[1;5C' forward-word

# Home key → Move to beginning of line
bindkey '^[[H' beginning-of-line

# End key → Move to end of line
bindkey '^[[F' end-of-line

# Delete key → Delete character under cursor
bindkey '^[[3~' delete-char

# Ctrl + Delete → Kill word forward (optional)
bindkey '^[[3;5~' kill-word

# Ctrl + Backspace → Kill word backward
bindkey '^H' backward-kill-word

# ------------------------------------------------------------------------------
# FUZZY FINDER (FZF)
# ------------------------------------------------------------------------------

# This may not be available so
if command -v fzf >/dev/null 2>&1; then
  # may not exist for old versions
  source <(fzf --zsh)
fi

# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }

# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }


# ------------------------------------------------------------------------------
# AUTOSUGGESTIONS
# ------------------------------------------------------------------------------

if [ -f "$Z_AUTO_SUGGEST_PATH" ]; then
    source "$Z_AUTO_SUGGEST_PATH"
fi


# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------

# Enable colors and prompt substitution
autoload -Uz colors && colors
setopt PROMPT_SUBST

# Git info function
git_prompt_info() {
  local branch git_status
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)
    if [[ -z "$branch" ]]; then
      branch="detached"
    fi
    git_status=$(git status --porcelain 2>/dev/null)
    if [[ -n "$git_status" ]]; then
      echo "%F{red}[$branch *]%f"  # Dirty
    else
      echo "%F{green}[$branch]%f"   # Clean
    fi
  fi
}


# Main prompt
PROMPT='%F{magenta}%n@%m%f %F{yellow}%~%f $(git_prompt_info)
%F{magenta}λ%f '

# RPROMPT='%F{242}%*%f'

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------
# Generic
alias ls='ls -G --color=auto --group-directories-first'
alias la='ls -lhA'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias cat='bat --theme=ansi -pp'
alias ..='cd ..'
alias ...='cd ../..'

# Fun stuff
alias weather="curl -s 'wttr.in'"
alias hyprpaper-fzf="fzf --preview='fzf-preview {}' | xargs hyprpaper-set"
# Functions
please() { sudo "$(fc -ln -1)" }

# ------------------------------------------------------------------------------
# Evals
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# SYNTAX HIGHLIGHTING : Must be loaded last, according to the git pages
# ------------------------------------------------------------------------------

if [ -f "$Z_SYNTAX_PATH" ]; then
    source "$Z_SYNTAX_PATH"
fi

# ------------------------------------------------------------------------------
# BREW: Ensure brew is properly initialized
# ------------------------------------------------------------------------------
BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -f "$BREW_PATH" ]; then
    eval "$($BREW_PATH shellenv zsh)"
fi
