let
  login-password = "login/shreyas";
in
{
  inputs,
  system,
  config,
  pkgs,
  ...
}:
let
  hyprland = inputs.hyprland.packages."${system}";
in
{
  imports = [
    ./home.nix
    ../../../modules/gaming.nix
  ];

  sops.defaultSopsFile = "/persist/etc/sops/secrets.yaml";
  sops.age.sshKeyPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];
  sops.validateSopsFiles = false;

  users.users.shreyas = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.${login-password}.path;
  };

  # services.uwsm = {
  #   enable = true;
  #   session.command = pkgs.writeShellScript "hyprland-start" ''
  #     export GTK_USE_PORTAL=1
  #     exec Hyprland
  #   '';
  # };

  # > Required:
  # >
  # > NixOS Module: enables critical components needed to run Hyprland properly.
  # > Without this, you may have issues with missing session files in your Display Manager.
  programs.hyprland = {
    enable = true;
    package = hyprland.hyprland;
    portalPackage = hyprland.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  services.fprintd = {
    enable = true;
  };

  i18n.extraLocaleSettings = {
    LC_TIME = "en_CA.UTF-8";
  };

  # have to enable here to set as default shell
  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  environment.wordlist.enable = true;

  sops.secrets.${login-password} = {
    neededForUsers = true;
  };
}
