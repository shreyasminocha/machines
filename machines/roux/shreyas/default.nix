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
      "docker"
      "forgejo" # lets us read git.shr.cx repos from the fs
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQ4LwnAkJZfyMnwQySfzlZsCBC/Alxv8S4ZGIf4g05x shreyasminocha@mars"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPqylgBi/zY65IsM1id5CoRO1J2dW+OzhRI7VIjjIcFV nix-on-droid@localhost"
    ];
  };
}
