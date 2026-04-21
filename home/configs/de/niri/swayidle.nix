{ pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = lib.getExe pkgs.swaylock;
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "loginctl lock-session";
      }
    ];
  };
}
