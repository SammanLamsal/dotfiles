{config, pkgs, ...}: 
{

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };


  environment.systemPackages = with pkgs; [


    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdiff3

  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.kdepim-runtime
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation
    kdePackages.kpat
    kdePackages.ksudoku
    kdePackages.ktorrent
  ];



}
