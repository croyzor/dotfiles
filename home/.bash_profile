# Bits and bobs
function set_ps1 {
    local COLS=$(tput cols)
    local STR="\u \w\$ "
    local DIVIDER=""
    for i in $(seq 1 $COLS)
    do
        CH='='
        DIVIDER=$CH$DIVIDER
    done
    # The \[ ... \] tells bash not to count the colour codes
    # to work out the length of the prompt!
    local PINK='\[\033[38;5;206m\]'
    local GREEN='\[\033[32m\]'
    local NC='\[\033[0m\]'
    local GIT_BRANCH_RAW=$(git branch --show-current 2> /dev/null)
    if [ -z $GIT_BRANCH_RAW ]
    then GIT_BRANCH_PREFIX=""
    else GIT_BRANCH_PREFIX="$GREEN($GIT_BRANCH_RAW)$NC "
    fi
    export PS1="$PINK$DIVIDER$NC\n$GIT_BRANCH_PREFIX$STR"
}

export PROMPT_COMMAND=set_ps1

export CARGO_NET_GIT_FETCH_WITH_CLI=true
