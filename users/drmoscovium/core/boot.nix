{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    kernelParams = [ "module_blacklist=i915" ];
    kernelPackages = pkgs.linuxPackages_6_1;
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
