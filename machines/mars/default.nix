{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./disko.nix

    ./hardware.nix
    ./fs.nix
    ./boot.nix
    ./networking.nix

    ./backups.nix

    ./i18n.nix
    ./greetd.nix
    ./fonts.nix
    ./printing.nix
    ./displaylink.nix

    ./shreyas
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.libinput.enable = true;

  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
    UV_LINK_MODE = "copy"; # TODO: move to h-m
  };

  nix = {
    settings =
      let
        subst = [
          # https://wiki.hypr.land/Nix/Cachix/
          "https://hyprland.cachix.org"
          "https://pwndbg.cachix.org"
          "https://niri.cachix.org"
        ];
      in
      {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        substituters = subst;
        trusted-substituters = subst;

        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "pwndbg.cachix.org-1:HhtIpP7j73SnuzLgobqqa8LVTng5Qi36sQtNt79cD3k="
          "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        ];
      };

    gc.dates = "weekly";
  };

  nixpkgs.overlays =
    let
      myoverlays = import ../../overlays;
    in
    [
      inputs.niri.overlays.niri
      inputs.nix-vscode-extensions.overlays.default
      inputs.dolphin-overlay.overlays.default
      inputs.misumisumi-flake.overlays.default

      myoverlays.overlays.default
    ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "cups-toshiba-estudio"
      "displaylink"
      "exact-audio-copy"
      "checkra1n"
      "slack"
      "discord"
      "zoom"
      "typora"
      "vscode-extension-github-copilot"
      "steam"
      "steam-unwrapped"
    ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05";
}
