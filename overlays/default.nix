{
  overlays = {
    default = final: prev: {
      black = prev.black.overrideAttrs (old: {
        propagatedBuildInputs = old.propagatedBuildInputs ++ prev.black.optional-dependencies.jupyter;
      });

      # https://github.com/rumboon/dolphin-overlay/issues/6
      kdePackages =
        let
          menuDir = prev.runCommand "kde-applications-menu" { } ''
            mkdir -p $out/etc/xdg/menus
            cp ${prev.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu \
              $out/etc/xdg/menus/applications.menu
          '';
        in
        prev.kdePackages
        // {
          dolphin = prev.symlinkJoin {
            name = "dolphin-wrapped";
            paths = [
              prev.kdePackages.dolphin
              prev.kdePackages.dolphin.dev
            ];
            nativeBuildInputs = [ prev.makeWrapper ];
            postBuild = ''
              rm $out/bin/dolphin
              makeWrapper ${prev.kdePackages.dolphin}/bin/dolphin $out/bin/dolphin \
                --set XDG_CONFIG_DIRS "${menuDir}/etc/xdg:$XDG_CONFIG_DIRS" \
                --run "${prev.kdePackages.kservice}/bin/kbuildsycoca6 ${menuDir}/etc/xdg/menus/applications.menu"
            '';
            passthru = (prev.kdePackages.dolphin.passthru or { }) // {
              dev = prev.kdePackages.dolphin.dev;
            };
          };
        };

    };
  };
}
