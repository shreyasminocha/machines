{ pkgs, ... }:
{
  imports = [
    ./home.nix
  ];

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
  };
}
