{
  pkgs-unstable,
  ...
}:
{
  programs.anyrun =
    let
      # as of $NOW, stable anyrun doesn't have niri-focus
      inherit (pkgs-unstable) anyrun;
    in
    {
      enable = true;
      package = anyrun;
      config = {
        x.fraction = 0.5;
        y.fraction = 0.25;
        width.absolute = 600;
        # height.absolute = 0;
        layer = "overlay";
        plugins = [
          "${anyrun}/lib/libapplications.so"
          "${anyrun}/lib/libsymbols.so"
          "${anyrun}/lib/librink.so"
          "${anyrun}/lib/libniri_focus.so"
        ];
      };
      extraCss = ''
        window {
          background-color: rgba(0, 0, 0, 0);
          font-family: 'Fira Code';
        }
      '';
    };
}
