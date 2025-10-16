{ lib, ... }:
{
  programs.atuin = lib.mkMerge [
    {
      enable = true;
      enableFishIntegration = true;
      flags = [ "--disable-up-arrow" ];
    }

    (lib.mkIf ((builtins.getEnv "hostname") != "localhost") {
      daemon.enable = true;
    })
  ];
  catppuccin.atuin.enable = true;
}
