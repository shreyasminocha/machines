{
  description = "shreyas machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "path:/home/shreyas/secret-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-24-05.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager-24-05 = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-24-05";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-24-05";
      inputs.home-manager.follows = "home-manager-24-05";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    impermanence.url = "github:nix-community/impermanence";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # > Do not override Hyprland's `nixpkgs` input unless you know what you are doing.
    # > Doing so will render the cache useless, since you're building from a different Nixpkgs commit.
    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.48.1";
      # url = "github:hyprwm/Hyprland?ref=v${hyprland-version}";
    };

    hy3 = {
      # url = "github:outfoxxed/hy3?ref=hl${hyprland-version}";
      url = "github:outfoxxed/hy3?ref=hl0.48.0";
      inputs.hyprland.follows = "hyprland";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-hyprwin.url = "github:uttarayan21/anyrun-hyprwin";

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dolphin-overlay = {
      url = "github:rumboon/dolphin-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    pwndbg = {
      url = "github:pwndbg/pwndbg";
    };

    misumisumi-flake = {
      url = "github:misumisumi/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-on-droid,
      secrets,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      # TODO: get rid of this overlay
      mypkgs = (pkgs.extend inputs.poetry2nix.overlays.default).callPackage ./pkgs { };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      packages.${system}.default = mypkgs;

      nixosConfigurations =
        let
          specialArgs = {
            inherit
              inputs
              system
              pkgs-unstable
              mypkgs
              secrets
              ;
          };
          commonModules = [
            home-manager.nixosModules.home-manager

            inputs.sops-nix.nixosModules.sops
            secrets.nixosModules.networks
          ];
        in
        {
          mars = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = commonModules ++ [
              inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
              inputs.disko.nixosModules.disko
              inputs.impermanence.nixosModules.impermanence
              inputs.catppuccin.nixosModules.catppuccin

              ./machines/mars
            ];
          };

          roux = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = commonModules ++ [
              inputs.nixos-hardware.nixosModules.hardkernel-odroid-h3

              ./machines/roux
            ];
          };
        };

      homeConfigurations.shreyas-mars = home-manager.lib.homeManagerConfiguration {
        pkgs = [ ];
        modules = [ ./home/mars ];
      };

      homeConfigurations.shreyas-roux = home-manager.lib.homeManagerConfiguration {
        pkgs = [ ];
        modules = [ ./home/roux ];
      };

      nixOnDroidConfigurations.mercury = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./machines/mercury
        ];
      };
    };
}
