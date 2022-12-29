{ config , pkgs, ...} :

{
  #
  hardware = {
    bluetooth.enable = true;

    firmware = [ pkgs.rtw89-firmware ];
    nvidia = {
      modesetting.enable = true;
      prime = {
        offload.enable = true;

        # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
        amdgpuBusId = "PCI:6:0:0";

        # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
        nvidiaBusId = "PCI:1:0:0";
      };
      powerManagement.enable = true;
    };

  };


}