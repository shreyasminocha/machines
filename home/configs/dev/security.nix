{
  inputs,
  pkgs,
  pkgs-unstable,
  lib,
  system,
  gui,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      jadx

      libusbmuxd
      checkra1n
      android-tools
      pkgs-unstable.frida-tools # TODO: switch to stable once it has 14.x.x

      pwntools

      # tshark
      mitmproxy
      pwncat

      john

      inputs.pwndbg.packages.${system}.pwndbg
    ]
    ++ lib.optionals gui [
      # inputs.ida-free.legacyPackages.${system}.ida-free
      ghidra-bin

      iaito
      (cutter.withPlugins (ps: with ps; [ rz-ghidra ]))

      wireshark
    ];

  home.file."/home/shreyas/.config/gdb/gdbearlyinit" = {
    text = ''
      set startup-quietly on
    '';
  };

  home.file."/home/shreyas/.config/gdb/gdbinit" = {
    text = ''
      set debuginfod enabled on
      set show-tips off
    '';
  };
}
