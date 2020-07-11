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

ZSH_THEME="classyTouch"

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
 DISABLE_AUTO_TITLE="true"

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
export FZF_DEFAULT_COMMAND="ag --hidden --depth 10 --ignore \".*Toon*\" --ignore \".npm\" --ignore .git --ignore \"node_modules*\" --ignore \".*unity*\" -f -g \"\""
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

(cat ~/.cache/wal/sequences &)
#(source ~/.cache/wal/colors-tty.sh &)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#< prompt 'japh' for Z shell

prompt_japh_help () {
    cat << __EOF0__
  prompt japh
    This is a fairly simple one-line prompt for zsh.
    It displays non-zero return codes from commands, as well as the
    number of background jobs (if any).
    This prompt controls PS1 as well as RPS1.
    The attributes (such as colors) the prompt uses can be changed on
    the fly via various styles, looked up by zstyle.
    Those styles are looked up in ':prompt:japh:<subcontext>'
    <subcontext> is either ':items:<item>' or 'setup'.
    <item> it one of the items in the prompt:
        + returnvalue
        + jobnum
        + histevent
        + dash
        + path
        + vcsinfo
        + percent
        + end
    'dash' is kind of special, because it is used everywhere a dash is used,
    not only in the standalone positon in the item list above. The 'end' item
    is what is used at the end of the prompt - a single space, by default.
    'vcsinfo' is the \${vcs_info_msg_0_} from the vcs_info subsystem of zsh.
    You should probably leave its attributes to empty strings and use
    its own configuration to colorize it (see below for an example).
    There are three pseudo-items:
        + histevent-delim: ()
        + jobnum-delim: ()
        + returnvalue-delim: []
    Those are delimiters around the respective items (the brackets mentioned).
    For each of those you can supply the same styles as for normal items.
    Available styles in 'setup':
        + use-attributes (type: boolean - default: true)
            Use attribute styles (see below); if set to false, the prompt
            will be without colors.
        + vcsinfo-in-rprompt (type: boolean - default: false)
            If true, use \${vcs_info_msg_0_} in RPS1 rather then
            before 'percent' in PS1.
    To conveniently switch between coloring for dark and light backgrounded
    terminals, you may use the 'prompt_japh_choose' utility. Call it without
    arguments to display usage information.
    Available styles in 'items:<item>':
        + attrib_pre
        + attrib_post
    These are actually strings, inserted before (pre) and after (post) the
    item reflected by the used context.
__EOF0__

    prompt_japh_precmd getdefaults
    cat << __EOF1__
This prompt uses the following vcs_info setup:
zstyle ':vcs_info:*'     actionformats " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%b%F{ye}|%F{red}%a%F{[ma}]%f-"
zstyle ':vcs_info:*'     formats       " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%b%F{ma}]%f-"
zstyle ':vcs_info:cvs:*' formats       " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%r%F{ma}]%f-"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b%F{red}:%F{ye}%r"
If you wish to change that, you have to do it *after* you called 'prompt japh'.
__EOF1__
}
#>
#< setup
prompt_japh_setup () {
    # load vcs_info and register our prompt function
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn
    zstyle ':vcs_info:*' check-for-changes true
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd prompt_japh_precmd
    if [[ ${ZSH_PROMPT_MY_TERMINAL_IS} == light || ${ZSH_PROMPT_MY_TERMINAL_IS} == bright ]]; then
        prompt_japh_choose light
    else
        prompt_japh_choose dark
    fi
    zstyle ':vcs_info:*'     actionformats " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%b%F{ye}|%F{red}%a%F{[ma}]%f-"
    zstyle ':vcs_info:*'     formats       " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%b%F{ma}%u]%f-"
    zstyle ':vcs_info:*'   unstagedstr   " * "
    zstyle ':vcs_info:cvs:*' formats       " %F{ma}(%f%s%F{ma})%F{ye}-%F{ma}[%F{green}%r%F{ma}]%f-"
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b%F{red}:%F{ye}%r"
}
#>
#< highlight styles
prompt_japh_zle_highlight_default () {
    emulate -L zsh
    local -i idx remove

    if [[ -t ${(t)zle_highlight} ]]; then
        typeset -ga zle_highlight
    fi
    if (( $# )); then
        remove=0
    else
        remove=1
    fi

    idx=${zle_highlight[(I)default:*]}
    if (( idx )); then
        if (( remove )); then
            zle_highlight[$idx]=()
        else
            zle_highlight[$idx]="default:$1"
        fi
    elif (( remove )); then
        return 0
    else
        zle_highlight+=( "default:$1" )
    fi
    return 0
}

prompt_japh_choose () {
    case $1 in
    (light|l|bright|b)
        zstyle ':prompt:japh:items:path' attrib_pre '%F{23}'
        zstyle ':prompt:japh:items:end'  attrib_pre '%F{232}'
        prompt_japh_zle_highlight_default
        ;;
    (dark|d)
        zstyle ':prompt:japh:items:path' attrib_pre '%F{30}'
        prompt_japh_zle_highlight_default fg=144
        ;;
    (*)
        printf 'usage: prompt_japh_choose <setting>\n'
        printf '  ...were <setting> is one of the following:\n'
        printf '    - dark (or d)       for dark terminal backgrounds\n'
        printf '    - light (or l)      for light terminal backgrounds\n'  # bright (or b) also works; lets keep that an easter egg
        ;;
    esac
}
#>
#< this is where we put the actual prompt together
prompt_japh_precmd () {
    setopt localoptions noksharrays extendedglob
    local -A sitems attrib_pre_def attrib_post_def attr_pre attr_post rv jn delims
    local -a items
    local item tmp

    items=( returnvalue )
    zstyle -t ':prompt:japh:setup' use-psvar1 && items+=( psv1 dash )
    items+=( jobnum histevent dash path vcsinfo percent end )
    attrib_pre_def=(
        dash              '%F{233}'
        end               '%F{178}'
        histevent         '%F{red}'
        histevent-delim   '%F{white}'
        jobnum            $'%{\033[1m%}%B'
        jobnum-delim      '%F{248}'
        path              '%F{248}'
        psv1              '%F{197}'
        percent           "%F{172}"
        returnvalue       '%K{234}%F{196}'
        returnvalue-delim '%K{233}%F{235}'
    )
    attrib_post_def=(
        dash              $'\b' # 'FIXME' ;-)
        end               ''
        histevent         '%f'
        histevent-delim   ''
        jobnum            '%F'
        jobnum-delim      $'\b' # 'FIXME' ;-)
        path              '%f'
        psv1              '%f'
        percent           ''
        returnvalue       '%f%k'
        returnvalue-delim '%f%k'
    )
    #sitems=( psv1 '%1v' dash ' ' percent '%#' end ' ' )
    sitems=( psv1 '%1v' dash '-' percent '%#' end ' ' histevent '%!' )
    #delims=( jobnum '()' returnvalue '[]' )
    delims=( histevent '()' jobnum '()' returnvalue '[]' )
    rv=( pre '%(?..' main    '%?' post '%dash%)'  )
    jn=( pre '%1(j.' main '%F{148}\$jobs[%F{33}%j%F{148}]' post '%dash%.)' )

    if [[ $1 == 'getdefaults' ]] ; then
        printf '\n    Defaults for attrib_pre:\n'
        for tmp in ${(ok)attrib_pre_def} ; do
            printf '       %18s '\''%s'\''\n' ${tmp} ${(V)attrib_pre_def[$tmp]}
        done
        printf '\n    Defaults for attrib_post:\n'
        for tmp in ${(ok)attrib_pre_def} ; do
            printf '       %18s '\''%s'\''\n' ${tmp} ${(V)attrib_post_def[$tmp]}
        done
        return 0
    fi
    vcs_info

    zstyle -s ':prompt:japh:items:path' length tmp && sitems[path]="%${tmp}~" || sitems[path]='%3~'
    if zstyle -T ':prompt:japh:setup' use-attributes ; then
        for item in psv{0..9} returnvalue{,-delim} path histevent{,-delim} percent jobnum{,-delim} end; do
            zstyle -s ":prompt:japh:items:${item}" attrib_pre  tmp && attr_pre[${item}]=${tmp}  || attr_pre[${item}]=${attrib_pre_def[$item]}
            zstyle -s ":prompt:japh:items:${item}" attrib_post tmp && attr_post[${item}]=${tmp} || attr_post[${item}]=${attrib_post_def[$item]}
        done
    fi

    PS1=''; RPS1=''
    for item in ${items} ; do
        case ${item} in
        (returnvalue)
            PS1+=${rv[pre]}
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[1]}${attr_post[${item}-delim]}
            PS1+=${attr_pre[${item}]}${rv[main]}${attr_post[${item}]}
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[2]}${attr_post[${item}-delim]}
            PS1+=${${rv[post]}//'%dash%'/${attr_pre[dash]}-${attr_post[dash]}}
            ;;
        (jobnum)
            PS1+=${jn[pre]}
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[1]}${attr_post[${item}-delim]}
            PS1+=${attr_pre[${item}]}${jn[main]}${attr_post[${item}]}
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[2]}${attr_post[${item}-delim]}
            PS1+=${${jn[post]}//'%dash%'/${attr_pre[dash]}-${attr_post[dash]}}
            ;;
        (histevent)
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[1]}${attr_post[${item}-delim]}
            PS1+=${attr_pre[${item}]}${sitems[${item}]}${attr_post[${item}]}
            PS1+=${attr_pre[${item}-delim]}${${delims[${item}]}[2]}${attr_post[${item}-delim]}
            ;;
        (dash|end|percent|path|psv<->)
            PS1+=${attr_pre[${item}]}${sitems[${item}]}${attr_post[${item}]}
            ;;
        (vcsinfo)
            if zstyle -t ':prompt:japh:setup' vcsinfo-in-rprompt ; then
                RPS1+=${vcs_info_msg_0_}${attr_post[end]}
            else
                PS1+=$'\n'${vcs_info_msg_0_}
            fi
            ;;
        (*)
            printf 'japh_prompt: Unknown item %s\n' ${item}
            ;;
        esac
    done
}
#>

prompt_japh_setup "$@"
