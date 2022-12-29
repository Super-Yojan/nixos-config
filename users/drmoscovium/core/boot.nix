{ config , pkgs, ...} :

{
  # Bootloader.
  boot= {
    kernelPackages =  pkgs.linuxPackages_6_1 ;
    loader = {
    efi = {
       canTouchEfiVariables = true;
       efiSysMountPoint = "/boot/efi";
    };
    grub = {
       enable = true;
       devices = [ "nodev" ];
       efiSupport = true;
       configurationLimit = 5;
       useOSProber = true;
    };
  };
  };
}