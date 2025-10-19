{ pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = lib.getExe pkgs.swaylock;
      }
    ];
  };
}
