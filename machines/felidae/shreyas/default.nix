let
  login-password = "login/shreyas";
in
{ config, pkgs, ... }:
{
  imports = [
    ./home.nix
  ];

  sops.defaultSopsFile = "/persist/etc/sops/secrets.yaml";
  sops.age.sshKeyPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];
  sops.validateSopsFiles = false;

  users.users.shreyas = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      # "docker"
      # "forgejo" # lets us read git.shr.cx repos from the fs
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEeLoe2R1VxJ34b/Zne93S3myEok6tW4RiM5LDpo/Bj shreyas@mars"
    ];
    hashedPasswordFile = config.sops.secrets.${login-password}.path;
  };

  sops.secrets.${login-password} = {
    neededForUsers = true;
  };
}
