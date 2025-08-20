#!/usr/bin/env bash

PACKAGES=(
    git
    tmux
    fzf
    neovim
    starship
    zoxide
    stow
    fd
    ripgrep
    bat
    lazygit
    node
    gcc
)

CASKS=(
    wezterm
    firefox
    font-jetbrains-mono-nerd-font
)

# should match with the servers specified in lspconfig plugin
LSPS=(
    lua-language-server
    pyright
    marksman
    llvm
    typescript-language-server
    gopls
)

# should match with the linters specified in nvim-lint plugin
LINTERS=(
    checkstyle
)

# install or update homebrew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

for package in "${PACKAGES[@]}"; do
    brew install "$package"
done

for cask in "${CASKS[@]}"; do
    brew install --cask "$cask"
done

for lsp in "${LSPS[@]}"; do
    brew install "$lsp"
done

brew cleanup
