{ pkgs, ... }:
let
  inherit (pkgs) rrsync;
  webroot = "/var/www/shreyasminocha.me";
  pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICajcayGE7/hdQUjrlHqgYJ9D2mcPsJzUyDFl7bdHMGw github-actions";
in
{
  environment.systemPackages = [ rrsync ];

  systemd.tmpfiles.rules = [
    "d ${webroot} 0755 gh-actions gh-actions -"
  ];

  users.users.gh-actions = {
    isNormalUser = true;
    group = "gh-actions";
    openssh.authorizedKeys.keys = [
      ''command="${rrsync}/bin/rrsync -wo ${webroot}",restrict ${pubkey}''
    ];
  };

  users.groups.gh-actions = { };
}
