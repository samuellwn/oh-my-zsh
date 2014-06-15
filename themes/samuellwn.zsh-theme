# current directory
local _dir="${fg[blue]}%~${reset_colors}"

# name of the machine
local machine="%m"

# current username
local username="%n"

# tty the user is logged into
local tty="${fg[blue]}tty: %y${reset_colors}"

# # or % depending on privileges
local privilege="${fg[green]}%#${reset_colors}"

# status of the parser
local pstat="%_"

# number of jobs
local jobs="${fg[blue]}jobs: %j${reset_colors}"

# current time
local time="%t"

# current date
local _date="%W"

# turns the color of the text passed in green or red depending on the last return value
#local return_value_color = function () {
#    "%{%(0?.${fg[green]}.${fg[red]})%}${1}%{${reset_color}%}"
#}

# return value of last command
local return_value="%{%(0?.${fg[green]}.${fg[red]})%}%?%{${reset_color}%}"

# git info
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# main prompt contains all information that makes sense
export PS1="
${time} ${_date} ${jobs} ${tty} $(git_prompt_info)
${username}@${machine} ${return_value} ${_dir}
${privilege}${fg[green]}>${reset_colors}"

# subprompt contains time and parser status
export PS2="${time} ${pstat}"

