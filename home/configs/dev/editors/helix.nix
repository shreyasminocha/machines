{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = false;
    settings = {
      # theme = "catppuccin_macchiato";
      editor = {
        cursor-shape.insert = "bar";
        bufferline = "multiple";
      };
    };
    languages.language = [
      {
        name = "nix";
        formatter = {
          command = "nixfmt-rfc-style";
        };
      }
    ];
  };
  catppuccin.helix.enable = true;
}
