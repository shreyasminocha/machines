{ pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    events = {
      lock = lib.getExe pkgs.swaylock;
    };
    timeouts = [
      {
        timeout = 300;
        command = "loginctl lock-session";
      }
    ];
  };
}
