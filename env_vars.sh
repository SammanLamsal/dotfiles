case "$OSTYPE" in 
    linux*)
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        eval "$(dircolors -b)"
        
        export WEZTERM_CONFIG_FILE="$HOME/wezterm_linux.lua"
        export JDTLS_CONFIG_PATH="/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.39.0/bin/jdtls"
    ;;
    darwin*)
        export WEZTERM_CONFIG_FILE="$HOME/wezterm_mac.lua"
        export JDTLS_CONFIG_PATH="/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.39.0/bin/jdtls"
    ;;
esac
