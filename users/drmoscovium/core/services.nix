{config, pkgs, lib, ...}:

{

  services = {    

    #printing service

    printing.enable = true;
    

    # enable blueman for windo managers only
    blueman.enable = true;



    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };


  
    # xserver services 
    xserver = {
      layout = "us";
      xkbVariant = "";
      videoDrivers = lib.mkDefault [ "nvidia" ];
		  enable = true;
		  displayManager = {
			  lightdm = {
          enable = true;
          greeters.gtk = {
            enable = true;
            theme.name = "Nordic";
            theme.package = pkgs.nordic;
          };
        };
		  };
		  desktopManager.plasma5.enable = true;
 		  libinput.enable = true;
      screenSection = ''
  Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
  Option         "AllowIndirectGLXProtocol" "off"
  Option         "TripleBuffer" "on"
'';
    };



    # dwm status
  };
}
