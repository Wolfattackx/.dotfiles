# ZSH Theme - classyTouch
# Author: Yaris Alex Gutierrez <yarisgutierrez@gmail.com>
# Prompt is the Oh-my-zsh version of user Graawr's 'Classy Touch' themes on http://dotshare.it

local current_dir='%{$FG[198]%}[%c% %{$FG[198]%}]%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'


PROMPT="%(?,%{$FG[198]%}┌─╼${current_dir}%{$reset_color%} ${git_branch}
%{$FG[198]%}└────╼%{$reset_color%} ,%{$fg[red]%}┌─╼${current_dir}%{$reset_color%} ${git_branch}
%{$FG[198]%}└╼ %{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
