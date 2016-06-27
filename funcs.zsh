# Opens the github page for the current git repository in your browser
# Takes an optional argument which is the file to view.
github () {
    giturl=$(git config --get remote.origin.url)

    if [ -z "$giturl" ]
    then
        echo "Not a git repository or no remote.origin.url set"
        exit 1;
    fi

    giturl=${giturl/git\@github\.com\:/https://github.com/}
    giturl=${giturl/\.git/\/tree/}

    branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
        branch="(unnamed branch)"
    branch=${branch##refs/heads/}

    giturl=$giturl$branch/$1
    open $giturl
}

# Moves files to trash
del () { mv $* ~/.Trash/ }

# Uses FZF to search ctags, opens file and goes go line.
tagsearch() {
    line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print $1"\t"$2}' tags |
    cut -c1-80 | fzf --nth=1,2
    )
    if [ -z $NVIM_LISTEN_ADDRESS ]
    then
        nvim "$(cut -f2 <<< $line)" -c "silent tag $(cut -f1 <<< $line)"
    else
        nvimex "edit $(cut -f2 <<< $line) | silent tag $(cut -f1 <<< $line)" -w
    fi
}
