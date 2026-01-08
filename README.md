# nixos configs

NixOS configs for my laptop (`mars`), homelab (`roux`), and more.

![Screenshot of my laptop screen showing `fastfetch`, `yazi`, and a LibreWolf window](./mars.png)

## Home Manager on non-NixOS

```sh
# add user to the nix-users group
nix run nixpkgs#home-manager switch --flake .#sminocha7-carlenny
# home-manager switch # ...
```

## License

[MIT License](./LICENSE)
