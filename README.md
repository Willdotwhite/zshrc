```
autoload colors; colors

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# User configuration
source "$HOME/.zsh/zshrc-base"

# Stuff across all environments
for file in $HOME/.zsh/common/zshrc-*; do
    source "$file"
done

# Stuff specific to this machine
for file in $HOME/.zsh/local/zshrc-*; do
    source "$file"
done
```
