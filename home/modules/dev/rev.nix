{
  inputs,
  pkgs,
  pkgs-unstable,
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

    inputs.pwndbg.packages."x86_64-linux".pwndbg
  ];

  home.file."/home/shreyas/.config/gdb/gdbearlyinit" = {
    text = ''
      set startup-quietly on
      set debuginfod enabled on
    '';
  };
}
