{

  # "Changing timezone via systemd is not supported when it is set in NixOS configuration."
  time.timeZone = null;

  i18n = {
    # defaultLocale = "en_US";
    extraLocales = [
      "en_IN/UTF-8"
      "en_US.UTF-8/UTF-8"
      "en_CA.UTF-8/UTF-8"
    ];
  };
}
