# General
abbr -a vim nvim
abbr -a code codium
abbr -a y yazi
abbr -a ht htop
abbr -a cls clear
abbr -a ls "eza -a --icons"
abbr -a ll "eza -lh --icons --git"
abbr -a la "eza -lah --icons --git"
abbr -a lt "eza -a --tree --level=1 --icons"
abbr -a cat bat

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