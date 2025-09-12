{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.vscode-jupyter-slideshow
  ];
  settings = {
    "jupyter.askForKernelRestart" = false;
    "jupyter.experiments.enabled" = false;
    # TODO: hmm
    "jupyter.widgetScriptSources" = [
      "jsdelivr.com"
      "unpkg.com"
    ];
  };
}
