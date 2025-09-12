{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tor-browser
    ladybird
  ];

  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;

      "webgl.disabled" = false;
      "widget.use-xdg-desktop-portal.file-picker" = 1;

      "app.normandy.first_run" = false;
      "apz.gtk.kinetic_scroll.enabled" = false;
      "beacon.enabled" = false;

      "browser.bookmarks.defaultLocation" = "unfiled";
      "browser.contentblocking.category" = "strict";
      "browser.download.always_ask_before_handling_new_types" = true;
      "browser.download.dir" = "/home/shreyas/documents/downloads";
      "browser.newtabpage.enabled" = false;
      "browser.policies.runOncePerModification.extentionsUninstall" =
        ''["google@search.mozilla.org", "bing@search.mozilla.org", "amazondotcom@search.mozilla.org", "ebay@search.mozilla.org", "twitter@search.mozilla.org"]'';
      "browser.policies.runOncePerModification.removeSearchEngines" =
        ''["Google", "Bing", "Amazon.com", "eBay", "Twitter"]'';
      "browser.policies.runOncePerModification.setDefaultSearchEngine" = "DuckDuckGo";
      "browser.startup.homepage" = "about:blank";
      "browser.uidensity" = 1;
      "browser.urlbar.suggest.engines" = false;

      "clipboard.autocopy" = false;
      "middlemouse.paste" = false;
    };
  };

  programs.firefox = {
    enable = true;
  };

  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.librewolf;
  #   profiles = {
  #     # todo: declarative-ify
  #     "voxspdej.default-release" = {};
  #   };
  # };

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
  };
}
