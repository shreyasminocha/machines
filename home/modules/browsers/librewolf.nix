{
  nur,
  secrets,
  system,
  ...
}:
{
  programs.librewolf = {
    enable = true;
    profiles.incognito = {
      isDefault = false;
      id = 1;
      settings = {
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
      };
      extensions = {
        packages = with nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          vimium
        ];
        force = true;
        settings = { };
      };
    };
    profiles.default = {
      isDefault = true;
      id = 0;
      extensions = {
        packages = with nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          zotero-connector
          vimium
          greasemonkey
          awesome-rss
        ];
        force = true;
        settings = {
          "uBlock0@raymondhill.net".settings = {
            userSettings = {
              advancedUserEnabled = true;
              externalLists = ''
                https://filters.adtidy.org/extension/ublock/filters/14.txt
                https://filters.adtidy.org/extension/ublock/filters/3.txt
                https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/AnnoyancesFilter/sections/antiadblock.txt
                https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt
                https://raw.githubusercontent.com/quenhus/uBlock-Origin-dev-filter/main/dist/duckduckgo/all.txt
                https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt
                https://secure.fanboy.co.nz/fanboy-annoyance_ubo.txt
              '';
              ignoreGenericCosmeticFilters = true;
              importedLists = [
                "https://filters.adtidy.org/extension/ublock/filters/14.txt"
                "https://filters.adtidy.org/extension/ublock/filters/3.txt"
                "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/AnnoyancesFilter/sections/antiadblock.txt"
                "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
                "https://raw.githubusercontent.com/quenhus/uBlock-Origin-dev-filter/main/dist/duckduckgo/all.txt"
                "https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt"
                "https://secure.fanboy.co.nz/fanboy-annoyance_ubo.txt"
              ];
              popupPanelSections = 63;
              webrtcIPAddressHidden = true;
            };
            selectedFilterLists = [
              "user-filters"
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
              "easylist"
              "adguard-generic"
              "easyprivacy"
              "adguard-spyware-url"
              "urlhaus-1"
              "plowe-0"
              "dpollock-0"
              "fanboy-cookiemonster"
              "adguard-cookies"
              "adguard-social"
              "easylist-newsletters"
              "easylist-annoyances"
              "adguard-other-annoyances"
              "adguard-popup-overlays"
              "ublock-annoyances"
              "IND-0"
              "https://filters.adtidy.org/extension/ublock/filters/14.txt"
              "https://filters.adtidy.org/extension/ublock/filters/3.txt"
              "https://secure.fanboy.co.nz/fanboy-annoyance_ubo.txt"
              "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/AnnoyancesFilter/sections/antiadblock.txt"
              "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
              "https://raw.githubusercontent.com/quenhus/uBlock-Origin-dev-filter/main/dist/duckduckgo/all.txt"
              "https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt"
            ];
            whitelist = [
              "chrome-extension-scheme"
              "moz-extension-scheme"
            ];
            userFilters = builtins.readFile "${secrets.packages.${system}.ubo-filters}/filters.txt";
          };
        };
      };
      containersForce = true;
      containers = {
        amazon = {
          icon = "cart";
          color = "yellow";
          id = 0;
        };
        "rice google" = {
          icon = "fingerprint";
          color = "blue";
          id = 1;
        };
        "sm7 google" = {
          icon = "fingerprint";
          color = "purple";
          id = 2;
        };
        wrek = {
          icon = "briefcase";
          color = "orange";
          id = 3;
        };
      };
      userChrome = ''
        .titlebar-buttonbox-container {
          display: none;
        }
      '';
    };
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
      "browser.toolbars.bookmarks.visibility" = "never";
      "browser.theme.content-theme" = 0;
      "browser.theme.toolbar-theme" = 0;
      "extensions.webextensions.uuids" = builtins.toJSON {
        "{e4a8a97b-f2ed-450b-b12d-ee082ba24781}" = "6a202489-4914-4b34-842d-c1d11242d207";
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "84cbcd69-f2f4-4a43-b682-aff593496582";
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "dd1f5437-0282-4899-b61b-6267eec59b99";
        "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}" = "1b16567a-e4e3-4f9f-bcf6-542f0f81e312";
        "uBlock0@raymondhill.net" = "4aaffaa0-18cd-4edf-bce6-6717df4faaee";
        "zotero@chnm.gmu.edu" = "032c2334-a51a-4bbd-9b0b-fcb28d219f68";
        "formautofill@mozilla.org" = "cb63f73d-a03f-49cd-bb49-6ddda8bd4f03";
        "newtab@mozilla.org" = "6d2f8bd6-a52e-4a7f-b651-23a6e7e56d9b";
        "pictureinpicture@mozilla.org" = "5ef1faa0-8dfc-42e2-9d49-9b9a2bab8ffd";
        "addons-search-detection@mozilla.com" = "0ef975a8-3c62-45e4-a0a9-3a79fbe5daa4";
        "webcompat@mozilla.org" = "9a310967-e580-48bf-b3e8-4eafebbc122d";
        "default-theme@mozilla.org" = "a93e9414-7bd3-48a4-b009-1a5494759b37";
        "firefox-compact-dark@mozilla.org" = "a2d1713e-f8e3-4801-8bd8-c6c6d969efdd";
      };

      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

      "browser.uiCustomization.state" = builtins.toJSON {
        "placements" = {
          "widget-overflow-fixed-list" = [ ];
          "unified-extensions-area" = [ ];
          "nav-bar" = [
            "back-button"
            "forward-button"
            "stop-reload-button"
            "vertical-spacer"
            "urlbar-container"
            "save-to-pocket-button"
            "downloads-button"
            "fxa-toolbar-menu-button"
            "unified-extensions-button"
            "ublock0_raymondhill_net-browser-action"
          ];
          "toolbar-menubar" = [ "menubar-items" ];
          "TabsToolbar" = [
            "tabbrowser-tabs"
            "new-tab-button"
            "alltabs-button"
          ];
          "vertical-tabs" = [ ];
          "PersonalToolbar" = [ "personal-bookmarks" ];
        };
        "seen" = [
          "developer-button"
          "ublock0_raymondhill_net-browser-action"
          "screenshot-button"
        ];
        "dirtyAreaCache" = [
          "nav-bar"
          "vertical-tabs"
          "toolbar-menubar"
          "TabsToolbar"
          "PersonalToolbar"
        ];
        "currentVersion" = 22;
        "newElementCount" = 3;
      };

      "clipboard.autocopy" = false;
      "middlemouse.paste" = false;

      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };

  catppuccin.librewolf.enable = true;
}
