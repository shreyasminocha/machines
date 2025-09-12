{
  inputs,
  pkgs,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session =
        let
          inherit (inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}) hyprland;
        in
        {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${hyprland}/share/wayland-sessions";
          user = "greeter";
        };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
