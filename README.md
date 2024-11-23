### Installations
##### Install Homebrew 
* https://brew.sh/
##### Install Neovim
* brew install neovim
##### Install Wezterm and zsh (if not already the default shell)
* brew install --cask wezterm
##### Install tmux
* brew install tmux
##### Install starship (prompt)
* brew install starship
##### Install npm
* brew install node
##### Install other tools
* install yazi
* install zoxide (replaces cd command with the --cmd cd flag in .zshrc)
* install fzf
### Fetch this GitHub Repo
* For Java development, make sure the ftplugin directory path for nvim jdtls is correct
### LSPs and Linters
* Install the language servers specified in ~/.dotfiles/.config/nvim/lua/config/plugins/lspconfig.lua
* Install the linters specified in ~/.dotfiles/.config/nvim/lua/config/plugins/nvim-lint.lua
### Other Plugins
* If markdown preview isn't working, try :call mkdp#util#install()
