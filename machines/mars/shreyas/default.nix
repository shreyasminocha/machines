let
  login-password = "login/shreyas";
in
{
  config,
  pkgs,
  ...
}:
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
      "dialout"
      "uucp"
    ];
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.${login-password}.path;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "niri";
        comment = "niri";
        binPath = "/run/current-system/sw/bin/niri-session";
      };
    };
  };

  # required, for some reason
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

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

  catppuccin.grub.enable = true;
  catppuccin.tty.enable = true;

  sops.secrets.${login-password} = {
    neededForUsers = true;
  };
}
