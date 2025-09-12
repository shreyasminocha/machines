{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    svelte.svelte-vscode
  ];
  settings = {
    "svelte.plugin.svelte.format.enable" = false;
    "svelte.enable-ts-plugin" = true;
    "svelte.plugin.svelte.note-new-transformation" = false;
  };
}
