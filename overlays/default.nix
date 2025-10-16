{
  overlays = {
    default = final: prev: {
      black = prev.black.overrideAttrs (old: {
        propagatedBuildInputs = old.propagatedBuildInputs ++ prev.black.optional-dependencies.jupyter;
      });

      # https://github.com/rumboon/dolphin-overlay/blob/55fec3268972876890d6081d3d76a701c37c01d7/default.nix
      kdePackages = prev.kdePackages.overrideScope (
        kfinal: kprev: {
          dolphin = kprev.dolphin.overrideAttrs (oldAttrs: {
            nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ prev.makeWrapper ];
            postInstall = (oldAttrs.postInstall or "") + ''
              wrapProgram $out/bin/dolphin \
                  --set XDG_CONFIG_DIRS "${prev.libsForQt5.kservice}/etc/xdg:$XDG_CONFIG_DIRS" \
                  --run "${kprev.kservice}/bin/kbuildsycoca6 --noincremental ${prev.libsForQt5.kservice}/etc/xdg/menus/applications.menu"
            '';
          });
        }
      );
    };
  };
}
