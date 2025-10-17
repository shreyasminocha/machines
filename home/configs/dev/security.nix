{
  inputs,
  pkgs,
  pkgs-unstable,
  system,
  ...
}:
{
  home.packages = with pkgs; [
    ghidra-bin
    # inputs.ida-free.legacyPackages.${system}.ida-free
    jadx

    libusbmuxd
    checkra1n
    android-tools
    pkgs-unstable.frida-tools # TODO: switch to stable once it has 14.x.x

    pwntools

    wireshark
    # tshark
    mitmproxy
    pwncat

    john

    inputs.pwndbg.packages.${system}.pwndbg
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
