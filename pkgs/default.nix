{ pkgs, ... }:
{
  tidal-dl-ng = pkgs.callPackage ./tidal-dl-ng { };
  zotero-addons = pkgs.callPackage ./zotero-addons { };
}
