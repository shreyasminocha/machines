{
  inputs,
  pkgs,
  ...
}:
{
  programs.anyrun = {
    enable = true;
    config = {
      # x.fraction = 0.5;
      # y.fraction = 0.25;
      # width.absolute = 600;
      # height.absolute = 0;
      # layer = "overlay";
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        # inputs.anyrun.packages.${pkgs.system}.niri-focus
        # inputs.anyrun-hyprwin.packages.${pkgs.system}.default
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
