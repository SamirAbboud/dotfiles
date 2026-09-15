# =============================================================================
# ABBREVIATIONS
# =============================================================================

# General Utilities
abbr -a code codium
abbr -a y yazi
abbr -a ht htop
abbr -a cls clear

# File Navigation (eza)
abbr -a ls "eza -a --icons=auto"
abbr -a ll "eza -lh --icons=auto --git"
abbr -a la "eza -lah --icons=auto --git"
abbr -a lt "eza -a --tree --level=1 --icons=auto"

# Git Workflow
abbr -a ga "git add ."
abbr -a gc "git commit -m"
abbr -a gi "git init"
abbr -a gs "git status"
abbr -a gp "git push"
abbr -a gl "git log"
abbr -a nah "git reset --hard && git clean -df"


# =============================================================================
# FUNCTIONS
# =============================================================================

# System Fetch Wrapper
function sf
    set -l config "$HOME/.config/sfetch/config.toml"

    switch "$argv[1]"
        case --minimal
            set config "$HOME/.config/sfetch/minimal.toml"
            set -e argv[1]
        case --long
            set config "$HOME/.config/sfetch/long.toml"
            set -e argv[1]
    end

    command sfetch --config "$config" $argv
end

# Theme Switcher
function theme-switch
    $HOME/.local/bin/theme $argv

    if test $status -eq 0
        source "$HOME/.config/fish/conf.d/theme.fish"
    end
end

# -----------------------------------------------------------------------------
# Btrfs Snapshot Management
# -----------------------------------------------------------------------------

function snap-create
    sudo btrfs subvolume snapshot -r / /snapshots/root-(date +%Y-%m-%d-%H%M)
end

function snap-list
    sudo btrfs subvolume list -s /
end

function snap-del
    if test -z "$argv[1]"
        echo "Error: Please specify snapshot path or pattern."
        return 1
    end
    sudo btrfs subvolume delete $argv[1]
end

# -----------------------------------------------------------------------------
# Lenovo Battery Management
# -----------------------------------------------------------------------------

function battery-status
    set -l node "/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
    if not test -f $node
        echo "Error: Lenovo conservation mode path not found."
        return 1
    end

    if test (cat $node) -eq 1
        echo "Conservation Mode: ENABLED (Capped at ~80%)"
    else
        echo "Conservation Mode: DISABLED (Full Charging ~100%)"
    end
end

function battery-toggle
    set -l node "/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
    if not test -f $node
        echo "Error: Lenovo conservation mode path not found."
        return 1
    end

    if test (cat $node) -eq 1
        echo 0 | sudo tee $node > /dev/null
        and echo "Switched to: Full Charging ENABLED (100%)"
    else
        echo 1 | sudo tee $node > /dev/null
        and echo "Switched to: Conservation Mode ENABLED (80%)"
    end
end
