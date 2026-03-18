let
  login-password = "login/shreyas";
in
{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./home.nix
    ../../../modules/gaming.nix
  ];

  sops.defaultSopsFile = "/persist/etc/sops/secrets.yaml";
  sops.age.sshKeyPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];
  sops.validateSopsFiles = false;

  users.users.shreyas = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "dialout"
      "uucp"
      "wireshark"
    ];
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.${login-password}.path;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "niri";
        comment = "niri";
        binPath = "/run/current-system/sw/bin/niri-session";
      };
    };
  };

  # required, for some reason
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # "Note that PAM must be configured to enable swaylock to perform authentication."
  security.pam.services.swaylock = { };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.pam.services = {
    # login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  # https://wiki.nixos.org/wiki/Solokey
  # https://github.com/solokeys/solo2-cli/blob/main/70-solo2.rules
  services.udev.packages = [
    pkgs.yubikey-personalization
    (pkgs.writeTextFile {
      name = "wally_udev";
      text = ''
        # NXP LPC55 ROM bootloader (unmodified)
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1fc9", ATTRS{idProduct}=="0021", TAG+="uaccess"
        # NXP LPC55 ROM bootloader (with Solo 2 VID:PID)
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="b000", TAG+="uaccess"
        # Solo 2
        SUBSYSTEM=="tty", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess"
        # Solo 2
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="beee", TAG+="uaccess"
      '';
      destination = "/etc/udev/rules.d/70-solo2.rules";
    })
  ];

  services.fprintd = {
    enable = true;
  };

  i18n.extraLocaleSettings = {
    LC_TIME = "en_CA.UTF-8";
  };

  # have to enable here to set as default shell
  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  environment.wordlist.enable = true;

  catppuccin.grub.enable = true;
  catppuccin.tty.enable = true;

  sops.secrets.${login-password} = {
    neededForUsers = true;
  };
}
