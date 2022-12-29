{ config, pkgs, ...}:
{

  fonts = {
    enableDefaultFonts = true;


  fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
    siji
    corefonts
    emacs-all-the-icons-fonts
  ];

   fontconfig = {
    defaultFonts = {
      serif = [ "JetBrainsMono" ];
      sansSerif = [ "JetBrainsMono" ];
      monospace = [ "JetBrainsMono" ];
    };
  };

  };

}