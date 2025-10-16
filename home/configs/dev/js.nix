{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    nodePackages_latest.prettier

    jqp
    yq
  ];

  programs.jq.enable = true;
}
