case "$OSTYPE" in 
    linux*)
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        eval "$(dircolors -b)"
        
        # on wsl, still need to put .wezterm.lua in WINDOWS home directory
        export WEZTERM_CONFIG_FILE="$HOME/wezterm_linux.lua"
        export JDTLS_CONFIG_PATH="/home/linuxbrew/.linuxbrew/bin/jdtls"
    ;;
    darwin*)
        export WEZTERM_CONFIG_FILE="$HOME/wezterm_mac.lua"
        export JDTLS_CONFIG_PATH="/opt/homebrew/bin/jdtls"
    ;;
esac
