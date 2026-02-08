{ mypkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles = {
      "shreyas" = {
        isDefault = true;
        extensions = [ mypkgs.thunderbird-addons.tbkeys-lite ];
        settings = {
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "datareporting.healthreport.uploadEnabled" = false;

          "browser.theme.dark-toolbar-theme" = true;
          "browser.theme.toolbar-theme" = 0;
          "calendar.alarms.playsound" = false;
          "calendar.alarms.show" = false;
          "calendar.timezone.useSystemTimezone" = true;
          "calendar.view.dayendhour" = 24;
          "font.name.monospace.x-western" = "Noto Sans Mono";
          "font.size.monospace.x-western" = 15;
          "intl.date_time.pattern_override.date_short" = "yyyy-MM-dd";
          "intl.date_time.pattern_override.time_short" = "HH:mm";
          "mail.biff.play_sound" = false;
          "mail.biff.show_alert" = false;
          "mail.biff.show_tray_icon" = false;
          "mail.compose.attachments.display.top" = true;
          "mail.compose.big_attachments.notify" = false;
          "mail.dark-reader.enabled" = true;
          "mail.default_send_format" = 1;
          "mail.e2ee.auto_enable" = true;
          "mail.inline_attachments" = false;
          "mail.purge.ask" = false;
          # "mail.root.imap" = "/home/shreyas/documents/email";
          "mail.shell.checkDefaultClient" = false;
          "mail.tabs.autoHide" = false;
          "mail.tabs.restoreSession" = 0;
          "mail.threadpane.listview" = 1;
          "mail.uifontsize" = 13;
          "mailnews.start_page.enabled" = false;
          "messenger.options.messagesStyle.theme" = "dark";
          "network.cookie.cookieBehavior" = 1;
          "network.dns.disablePrefetch" = true;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "places.history.enabled" = false;
          "privacy.donottrackheader.enabled" = true;
          "search.default" = "ddg";
          "searchintegration.enable" = false;
          "spellchecker.dictionary" = "en-US,en-GB";

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #toolbar-menubar {
            order: -1;
          }

          #unifiedToolbar {
            margin: -32px;
          }

          #unifiedToolbarContent {
            display: none !important;
          }

          .titlebar-buttonbox-container {
            display: none;
          }
        '';
      };
      "4kg8mz55.default-release".isDefault = false;
    };
  };
}
