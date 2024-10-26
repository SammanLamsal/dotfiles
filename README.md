### Installations
##### Install Homebrew 
* https://brew.sh/
##### Install neovim
* brew install Neovim
##### Install Wezterm and zsh (if not already the default shell)
* brew install --cask wezterm
##### Install tmux
* brew install tmux
##### Install starship (prompt)
* brew install starship
##### Install npm
* brew install node
### Fetch this GitHub Repo
* For Java development, use the correct branch (WSL or Mac) to download the ftplugin directory for nvim jdtls
* Also use the correct branch to download the .wezterm.lua config file
### LSPs and Linters
* Install the language servers specified in ~/.dotfiles/.config/nvim/lua/config/plugins/lspconfig.lua
* Install the linters specified in ~/.dotfiles/.config/nvim/lua/config/plugins/nvim-lint.lua
### Other Plugins
* If markdown preview isn't working, try :call mkdp#util#install()
