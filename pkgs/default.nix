{ pkgs, ... }:
{
  tidal-dl-ng = pkgs.callPackage ./tidal-dl-ng { };
  # https://github.com/misumisumi/flakes/blob/2a4555109a974262aea3550d1f979a53a8c7377a/modules/home-manager/zotero.nix
  zotero-addons = pkgs.callPackage ./zotero-addons { };
  # https://github.com/nix-community/nur-combined/blob/c61afdf216c161e6146d03a470d5816b6af5f898/repos/rycee/pkgs/firefox-addons/default.nix
  firefox-addons = pkgs.callPackage ./firefox-addons { };
  thunderbird-addons = pkgs.callPackage ./thunderbird-addons { };
}
