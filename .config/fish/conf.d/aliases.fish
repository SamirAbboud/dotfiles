# General
abbr -a code codium
abbr -a y yazi
abbr -a ht htop
abbr -a cls clear
abbr -a ls "eza -a --icons=auto"
abbr -a ll "eza -lh --icons=auto --git"
abbr -a la "eza -lah --icons=auto --git"
abbr -a lt "eza -a --tree --level=1 --icons=auto"

# Git
abbr -a ga "git add ."
abbr -a gc "git commit -m"
abbr -a gi "git init"
abbr -a gs "git status"
abbr -a gp "git push"
abbr -a gl "git log"
abbr -a nah "git reset --hard && git clean -df"

function sfetch
    set config "$HOME/.config/sfetch/default.py"

    switch "$argv[1]"
        case --minimal
            set config "$HOME/.config/sfetch/minimal.py"
            set -e argv[1]

        case --long
            set config "$HOME/.config/sfetch/long.py"
            set -e argv[1]
    end

    python3 "$HOME/sfetch/sfetch.py" --config "$config" $argv
end

function theme-switch
    ~/.local/bin/theme $argv

    if test $status -eq 0
        source ~/.config/fish/conf.d/theme.fish
    end
end