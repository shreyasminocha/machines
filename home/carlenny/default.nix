{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin

    ./misc.nix

    ../configs/term
    ../configs/dev
    ../configs/misc.nix
  ];

  home.username = "sminocha7";
  home.homeDirectory = "/home/sminocha7";

  home.shell.enableFishIntegration = true;

  home.sessionVariables = {
    PATH = (
      "${config.home.homeDirectory}/.nix-profile/bin"
      + ":/usr/local/sbin"
      + ":/usr/local/bin"
      + ":/usr/sbin"
      + ":/usr/bin"
      + ":/sbin"
      + ":/bin"
      + ":/usr/games"
      + ":/usr/local/games"
      + ":/snap/bin"
    );
    TERMINFO = "${pkgs.kitty}/lib/kitty/terminfo";
  };

  # if we can't chsh...
  home.file.".bashrc".text = "${config.programs.fish.package}/bin/fish";

  home.file.".config/nix/nix.conf".text = "extra-experimental-features = nix-command flakes";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";
}
