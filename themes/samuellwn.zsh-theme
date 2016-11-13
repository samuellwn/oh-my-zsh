# current directory
local _dir="%{${fg[red]}%}%~%{${reset_color}%}"

# name of the machine
local machine="%{${fg[red]}%}%m%{${reset_color}%}"

# current username
local username="%{${fg[red]}%}%n%{${reset_color}%}"

# tty the user is logged into
local tty="%{${fg[blue]}%}tty: %{${fg[red]}%}%l${reset_color}%}"

# # or % depending on privileges
local privilege="%{${fg[green]}%}%#%{${reset_color}%}"

# status of the parser
local pstat="%_"

# number of jobs
local jobs="%{${fg[blue]}%}jobs: %{${fg[red]}%}%j%{${reset_color}%}"

# current time
local time="%{${fg[red]}%}%D{%I:%M%p}%{${reset_color}%}"

# current date
local _date="%{${fg[red]}%}%D{%B %f, %Y (%m/%d/%Y)}%{${reset_color}%}"

# turns the color of the text passed in green or red depending on the last
# return value (this code comment out due to possible zsh bug)
#local return_value_color = function () {
#    echo "%{%(0?.${fg[green]}.${fg[red]})%}${1}%{${reset_color}%}"
#}

# return value of last command
local return_value="%{%(0?.${fg[green]}.${fg[red]})%}%?%{${reset_color}%}"

# git info
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git: %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# python virtualenv info
ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg[blue]%}python venv: %{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"

# main prompt contains all information that makes sense
export PS1="
${time} ${_date} ${jobs} ${tty}\$(git_prompt_info)\$(virtualenv_prompt_info)
${username}@${machine} ${return_value} ${_dir}
${privilege}%{${fg[green]}%}>%{${reset_color}%}"

# subprompt contains time and parser status
export PS2="${time} ${pstat} >"
