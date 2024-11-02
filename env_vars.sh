case "$OSTYPE" in 
    linux*)
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        eval "$(dircolors -b)"
        
        # on wsl, still need to put .wezterm.lua in WINDOWS home directory
        export JDTLS_CONFIG_PATH="/home/linuxbrew/.linuxbrew/bin/jdtls"
    ;;
    darwin*)
        export JDTLS_CONFIG_PATH="/opt/homebrew/bin/jdtls"
    ;;
esac
