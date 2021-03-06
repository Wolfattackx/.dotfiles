# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wolfattackx/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="jovial"
#ZSH_THEME="wedisagree"

ZSH_THEME="gruvbox"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  urltools
)

source $ZSH/oh-my-zsh.sh

# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi='nvim'
alias vim='nvim'

#EXPORT BINARIES
#export PATH="/home/$USER/glslViewer/bin/glslViewer:$PATH"
export PATH="/home/$USER/.local/bin/:$PATH"
export EDITOR=nvim
 export VISUAL=nvim
#export FZF_DEFAULT_COMMAND="ag --hidden --depth 10 --ignore \".*Toon*\" --ignore \".npm\" --ignore .git --ignore \"node_modules*\" --ignore \".*unity*\" -f -g \"\""
export XDG_DATA_DIRS="/var/lib/snapd/desktop/:/usr/local/share:/usr/share"

#Functions for fzf custom commands
function edit_fzf() {
	temp=$(ag --hidden --depth 10 --ignore ".npm" --ignore .git --ignore "node_modules*" --ignore ".*unity*" -f -g "" | fzf --multi --preview="cat {}")
	if [[ ! -z "$temp" ]]
	then
		nvim -p "${temp}"
	fi
}

function cd_fzf() {
	cd ~
	temp=$(find -L -maxdepth 2 -type d -not -path "node_modules*" -not -path ".npm" -not -path ".*unity*" -not -path ".*.git" 2> /dev/null | fzf --preview='tree -L 3 {}')
	if [[ ! -z "$temp" ]]
	then
		cd "${temp}"
		zle reset-prompt
	fi
}

zle -N edit_fzf
zle -N cd_fzf
bindkey '^O' edit_fzf
bindkey '^F' cd_fzf

#(cat ~/.cache/wal/sequences &)
#(source ~/.cache/wal/colors-tty.sh &)
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
