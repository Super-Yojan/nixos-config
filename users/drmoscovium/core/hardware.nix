{ config, pkgs, lib, ... }:

{
  #
  hardware = {
    bluetooth.enable = true;
    opengl.extraPackages = with pkgs; [ vaapiVdpau ];
    opengl.driSupport = true;
    firmware = [ pkgs.rtw89-firmware ];
    nvidia = {
      modesetting.enable = true;
      prime = {
        sync.enable = lib.mkDefault true;

        # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
        amdgpuBusId = "PCI:6:0:0";

        # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
        nvidiaBusId = "PCI:1:0:0";
      };
      powerManagement.enable = true;
    };

  };

}
