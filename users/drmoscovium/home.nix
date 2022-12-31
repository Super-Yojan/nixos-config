{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "drmoscovium";
  home.homeDirectory = "/home/drmoscovium";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # imports = [ ./modules/default.nix ];

  #  dwm = {
  #   enable = true;
  #  };


programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-gstreamer
    ];
  };

  home.packages = with pkgs; [ htop 
    obsidian
    neofetch
    brave
    spotify
    discord
    vscode
    st
    dmenu
    kdeconnect
    mpv
    libsForQt5.kdenlive
    gimp


    # development
    rustc
    gcc
    python3
  ];
  
}
