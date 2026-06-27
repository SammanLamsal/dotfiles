{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    starship

    git
    curl
    wget
    ripgrep
    fd
    fzf
    jq
    delta
    tmux
    zoxide
    lazygit

    neovim
    tmux
    stow
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;

}

