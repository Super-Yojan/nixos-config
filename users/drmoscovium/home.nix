{ config, pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url =
      "https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz";
    sha256 = "18c4q728y59mk83mx2i4vn7kppgcd4azxrq84r8z48684byaraq7";
  }) {
    doomPrivateDir =
      ./home/doom-emacs/.doom.d; # Directory containing your config.el init.el
    # and packages.el files
    emacsPackagesOverlay = self: super: {
      magit-delta = super.magit-delta.overrideAttrs
        (esuper: { buildInputs = esuper.buildInputs ++ [ pkgs.git ]; });
    };
  };
  flake-compat = builtins.fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    sha256 = "0xcr9fibnapa12ywzcnlf54wrmbqqb96fmmv8043zhsycws7bpqy";
  };
  my-python-packages = p: with p; [ pandas numpy requests manim ];

in {
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

  # imports = [ ./home/doom-emacs/doom-emacs.nix ];

  #  dwm = {
  #   enable = true;
  #  };

  services.emacs = {
    enable = true;
    package =
      doom-emacs; # Not needed if you're using the Home-Manager module instead
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [ wlrobs obs-gstreamer ];
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.packages = with pkgs; [
    htop
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
    valgrind

    doom-emacs
    nixfmt

    # development
    cargo
    rustc
    rust-analyzer
    rustfmt
    # clang
    gcc

    gdb

    notion-app-enhanced

    ffmpeg
    vlc

    easyeffects
    python3
    pango

    yt-dlp
    audacity

  ];

}
