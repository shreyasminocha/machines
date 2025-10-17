{
  buildThunderbirdXpiAddon,
  fetchurl,
  lib,
  stdenv,
}:
{
  "tbkeys-lite" = buildThunderbirdXpiAddon {
    pname = "tbkeys-lite";
    version = "2.4.1";
    addonId = "tbkeys-lite@addons.thunderbird.net";
    url = "https://addons.thunderbird.net/thunderbird/downloads/file/1040513/tbkeys_lite-2.4.1-tb.xpi";
    sha256 = "sha256-g70H7OqanA73eUJpOAWf+Nkg74ZRnmZoRXpuCKse1+w=";
    meta = with lib; {
      description = "Custom Thunderbird keybindings";
      license = licenses.mpl20;
      mozPermissions = [ ];
      platforms = platforms.all;
    };
  };
}
