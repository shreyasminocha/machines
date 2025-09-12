{ pkgs, ... }:
{
  i18n = {
    glibcLocales = pkgs.glibcLocales.override {
      allLocales = false;
      locales = [
        "en_IN/UTF-8"
        "en_US.UTF-8/UTF-8"
        "en_CA.UTF-8/UTF-8"
        "hi_IN/UTF-8"
        "de_DE.UTF-8/UTF-8"
        "zh_CN.UTF-8/UTF-8"
      ];
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-chinese-addons
          fcitx5-table-other
          fcitx5-table-extra
          fcitx5-m17n
        ];
        settings = {
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
            };

            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "m17n_hi_inscript";
            "Groups/0/Items/2".Name = "pinyin";
          };
          globalOptions = {
            Hotkey = {
              EnumerateWithTriggerKeys = true;
              EnumerateSkipFirst = false;
            };
            "Hotkey/TriggerKeys"."0" = "Control+space";
            "Hotkey/EnumerateForwardKeys"."0" = "Control+space";
            "Hotkey/EnumerateBackwardKeys"."0" = "Control+Shift+space";
            Behavior = {
              ShareInputState = "All";
              PreeditEnabledByDefault = true;
              ShowInputMethodInformation = true;
              showInputMethodInformationWhenFocusIn = false;
              CompactInputMethodInformation = true;
            };
            "Behavior/DisabledAddons"."0" = "cloudpinyin";
          };
        };
      };
    };
  };
  # catppuccin.fcitx5.enable = true;
}
