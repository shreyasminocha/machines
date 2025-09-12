{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TODO: these are deps of something else iirc
    lame
    sox
    python312Packages.eyed3

    sops
    ruby
    caddy
    sqlite

    lm_sensors
  ];

  programs.yt-dlp.enable = true;

  # TODO: fix duplication of these settings
  sops = {
    # if this isn't a "string to the full path", it will be added to the store
    defaultSopsFile = "/etc/sops/secrets.yaml";
    validateSopsFiles = false;

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };
}
