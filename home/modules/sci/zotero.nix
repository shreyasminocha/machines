{
  pkgs,
  gui,
  ...
}:
{
  programs.zotero = {
    enable = gui;
    profiles.default = {
      settings = {
        "browser.theme.toolbar-theme" = 0;
        "extensions.zotero.dataDir" = "/home/shreyas/documents/zotero";
        "extensions.zotero.reader.contentDarkMode" = false;
        "extensions.zotero.uiDensity" = "compact";
        "extensions.zotero.useDataDir" = true;
        "extensions.zotero.tagSelector.showAutomatic" = false;
        "extensions.zotero.autoRenameFiles" = true;

        "extensions.zotero.downloadAssociatedFiles" = true;
        "extensions.zotero.autoRecognizeFiles" = true;
        "extensions.zotero.automaticSnapshots" = true;

        "extensions.zotero.sync.autoSync" = true;
        "extensions.zotero.sync.fulltext.enabled" = true;
        "extensions.zotero.sync.storage.enabled" = true;
        "extensions.zotero.sync.storage.groups.enabled" = true;

        "extensions.update.autoUpdateDefault" = false;

        "extensions.zotero.translators.better-bibtex.bibtexURL" = "url";
        "extensions.zotero.translators.better-bibtex.citekeyFormat" =
          "auth.lower + \"_\" + shorttitle.lower + \"_\" + year";
        "extensions.zotero.translators.better-bibtex.citekeyFormatEditing" =
          "auth.lower + \"_\" + shorttitle.lower + \"_\" + year";
        "extensions.zotero.translators.better-bibtex.skipFields" =
          "urldate,abstract,file,annotation,keywords";

        "extensions.zotero.zotero-reading-list.enable-keyboard-shortcuts" = true;
        "extensions.zotero.zotero-reading-list.label-items-when-opening-file" = false;
        "extensions.zotero.zotero-reading-list.label-new-items" = "|none|";
        "extensions.zotero.zotero-reading-list.read-status-format" = 0;
        "extensions.zotero.zotero-reading-list.readstatuscolumn-format-header-showicon" = false;
        "extensions.zotero.zotero-reading-list.status-change-on-open-item-list" =
          "New;To Read|In Progress;In Progress";
        "extensions.zotero.zotero-reading-list.statuses-and-icons-list" =
          "To Read;In Progress;Read;Not Reading;To Read Eventually|📙;📖;📗;📕;☁️";
      };

      extensions = with pkgs.zotero-addons; [
        zotero-better-bibtex
        zotero-reading-list
      ];
    };
  };
}
