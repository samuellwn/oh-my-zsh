# current directory
local _dir="${fg[blue]}%~${reset_colors}"

# name of the machine
local _machine="%m"

# current username
local _username="%n"

# tty the user is logged into
local _tty="${fg[blue]}tty: %y${reset_colors}"

# # or % depending on privileges
local _privilege="${fg[green]}%#${reset_colors}"

# status of the parser
local _pstat="%_"

# number of jobs
local _jobs="${fg[blue]}jobs: %j${reset_colors}"

# current time
local _time="%t"

# current date
local _date="%W"

# turns the color of the text passed in green or red depending on the last return value
local _retvalcolor = function () {
    echo "%{%(0?.${fg[green]}.${fg[red]})%}${1}%{${reset_color}%}"
}

# return value of last command
local _retval="$(_retvalcolor %?)"

# git info
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# main prompt contains all information that makes sense
export PS1="
${_time} ${_date} ${_jobs} ${_tty} $(git_prompt_info)
${_username}@${_machine} ${_retval} ${_dir}
${_privilege}${fg[green]}>${reset_colors}"

# subprompt contains time and parser status
export PS2="${_time} ${_pstat}"

