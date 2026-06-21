{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    deno

    bun
    pnpm

    prettier

    jqp
    yq
  ];

  programs.jq.enable = true;
}
