{
  buildFirefoxXpiAddon,
  fetchurl,
  lib,
  stdenv,
}:
{
  "awesome-rss" = buildFirefoxXpiAddon {
    pname = "awesome-rss";
    version = "1.3.6resigned1";
    addonId = "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4272927/awesome_rss-1.3.6resigned1.xpi";
    sha256 = "383981387b37cba3ba1931235dfa58cb8b76ec7dff6195d1adbfde221a26c36b";
    meta = with lib; {
      description = "Puts an RSS/Atom subscribe button back in URL bar.\n\nSupports \"Live Bookmarks\" (built-in), Feedly, &amp; Inoreader";
      license = licenses.gpl3;
      mozPermissions = [
        "tabs"
        "storage"
        "<all_urls>"
      ];
      platforms = platforms.all;
    };
  };
  "bitwarden" = buildFirefoxXpiAddon {
    pname = "bitwarden";
    version = "2025.9.0";
    addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4580978/bitwarden_password_manager-2025.9.0.xpi";
    sha256 = "601b6e38ddcdde8f42fc48c7c978e3ad5a69ae5c082312932b7998c824bf9343";
    meta = with lib; {
      homepage = "https://bitwarden.com";
      description = "At home, at work, or on the go, Bitwarden easily secures all your passwords, passkeys, and sensitive information.";
      license = licenses.gpl3;
      mozPermissions = [
        "<all_urls>"
        "*://*/*"
        "alarms"
        "clipboardRead"
        "clipboardWrite"
        "contextMenus"
        "idle"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "notifications"
        "file:///*"
      ];
      platforms = platforms.all;
    };
  };
  "greasemonkey" = buildFirefoxXpiAddon {
    pname = "greasemonkey";
    version = "4.13";
    addonId = "{e4a8a97b-f2ed-450b-b12d-ee082ba24781}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4332091/greasemonkey-4.13.xpi";
    sha256 = "31b9e9521eac579114ed20616851f4f984229fbe6d8ebd4dc4799eb48c59578c";
    meta = with lib; {
      homepage = "http://www.greasespot.net/";
      description = "Customize the way a web page displays or behaves, by using small bits of JavaScript.";
      license = licenses.mit;
      mozPermissions = [
        "<all_urls>"
        "clipboardWrite"
        "cookies"
        "downloads"
        "notifications"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
      ];
      platforms = platforms.all;
    };
  };
  "vimium" = buildFirefoxXpiAddon {
    pname = "vimium";
    version = "2.3";
    addonId = "{d7742d87-e61d-4b78-b8a1-b469842139fa}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4524018/vimium_ff-2.3.xpi";
    sha256 = "3da9c02f6ba1c7ae00ba85c87a7f47355904137467547e96199a455553608e9b";
    meta = with lib; {
      homepage = "https://github.com/philc/vimium";
      description = "The Hacker's Browser. Vimium provides keyboard shortcuts for navigation and control in the spirit of Vim.";
      license = licenses.mit;
      mozPermissions = [
        "tabs"
        "bookmarks"
        "history"
        "storage"
        "sessions"
        "notifications"
        "scripting"
        "webNavigation"
        "search"
        "clipboardRead"
        "clipboardWrite"
        "<all_urls>"
        "file:///"
        "file:///*/"
      ];
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.66.4";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4578681/ublock_origin-1.66.4.xpi";
    sha256 = "bc62cd930601212f1568964389352bbd4b1808466f2c9ac1198c754338077fb0";
    meta = with lib; {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
      license = licenses.gpl3;
      mozPermissions = [
        "alarms"
        "dns"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "http://*/*"
        "https://*/*"
        "file://*/*"
        "https://easylist.to/*"
        "https://*.fanboy.co.nz/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://*.github.io/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
      ];
      platforms = platforms.all;
    };
  };
  "zotero-connector" = buildFirefoxXpiAddon {
    pname = "zotero-connector";
    version = "5.0.185";
    addonId = "zotero@chnm.gmu.edu";
    url = "https://download.zotero.org/connector/firefox/release/Zotero_Connector-5.0.185.xpi";
    sha256 = "064ed203b928a2acd5d4256d0db7831f5d6cc8dbe0a2363dd1ffef9a2d0a95a9";
    mozPermissions = [
      "http://*/*"
      "https://*/*"
      "tabs"
      "contextMenus"
      "cookies"
      "storage"
      "scripting"
      "webRequest"
      "webRequestBlocking"
      "webNavigation"
      "declarativeNetRequest"
      "management"
      "clipboardWrite"
    ];
    meta = with lib; {
      homepage = "https://www.zotero.org/";
      description = "Save references to Zotero from your web browser";
      license = licenses.agpl3Plus;
      platforms = platforms.all;
    };
  };
}
