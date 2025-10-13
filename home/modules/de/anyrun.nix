{
  inputs,
  system,
  ...
}:
{
  programs.anyrun =
    let
      anyrun-pkgs = inputs.anyrun.packages.${system};
    in
    {
      enable = true;
      package = anyrun-pkgs.anyrun;
      config = {
        x.fraction = 0.5;
        y.fraction = 0.25;
        width.absolute = 600;
        # height.absolute = 0;
        layer = "overlay";
        plugins = with anyrun-pkgs; [
          applications
          niri-focus
          # inputs.anyrun-hyprwin.packages.${system}.default
        ];
      };
      extraCss = ''
        #window {
          background-color: rgba(0, 0, 0, 0);
          font-family: 'Fira Code';
        }
      '';
    };
}
