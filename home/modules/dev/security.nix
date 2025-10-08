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
    jadx

    libusbmuxd
    checkra1n
    android-tools
    pkgs-unstable.frida-tools

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
      set debuginfod enabled on
    '';
  };
}
