{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    bun
    pnpm

    nodePackages_latest.prettier

    jqp
    yq
  ];

  programs.jq.enable = true;
}
