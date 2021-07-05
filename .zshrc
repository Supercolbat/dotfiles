# .zshrc config
# second line lorem ipsum dolor sit amet sample text 123 123
# by (but mostly not written by) Supercolbat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/supercolbat/.oh-my-zsh"

# Selected theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set language environment
export LANG=en_US.UTF-8

# Set NeoVIM as preferred editor
export EDITOR='nvim'

# Make comments ~~great~~ visible again
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='none'

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git dnf zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# User configuration

alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
