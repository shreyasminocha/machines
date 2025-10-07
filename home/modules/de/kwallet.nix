{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kwallet
    kdePackages.kwalletmanager
  ];
}
