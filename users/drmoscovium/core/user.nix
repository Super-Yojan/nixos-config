{config, pkgs, lib, ...}: 
let
  user = "drmoscovium";
in 
{
  users.users.${user} = {
    isNormalUser = true;
    description = "drMoscovium";
    shell = pkgs.zsh;
    home = "/home/${user}";
    extraGroups = [ "networkmanager" "wheel" ];
   
  };
}
