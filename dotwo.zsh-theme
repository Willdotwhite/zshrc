# Install to ~/.oh-my-zsh/custom/themes/
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_symbol='#'
else
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

function parse_git_dirty() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT="${current_dir} ${git_branch} %B${user_symbol}%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
