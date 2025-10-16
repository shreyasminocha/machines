{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    eamodio.gitlens
  ];
  settings = {
    "gitlens.currentLine.enabled" = false;
    "gitlens.hovers.currentLine.over" = "line";
    "gitlens.codeLens.enabled" = false;
    "gitlens.defaultDateFormat" = "MMMM D, YYYY h:mm A";
    "gitlens.defaultDateShortFormat" = "DD MMM YYYY";
    "gitlens.showWhatsNewAfterUpgrades" = false;
    "gitlens.currentLine.pullRequests.enabled" = false;
    "gitlens.telemetry.enabled" = false;
    "gitlens.hovers.enabled" = false;
    "gitlens.graph.experimental.minimap.enabled" = true;
  };
}
