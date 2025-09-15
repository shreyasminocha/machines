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

    # > Do not override Hyprland’s `nixpkgs` input unless you know what you are doing.
    # > Doing so will render the cache useless, since you’re building from a different Nixpkgs commit.
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
      secrets,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}.extend inputs.poetry2nix.overlays.default;
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      mypkgs = pkgs.callPackage ./pkgs { };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      packages.${system}.default = mypkgs;

      nixosConfigurations.mars = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            system
            pkgs-unstable
            mypkgs
            ;
        };

        modules = [
          inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
          inputs.impermanence.nixosModules.impermanence
          inputs.disko.nixosModules.disko
          inputs.catppuccin.nixosModules.catppuccin

          inputs.sops-nix.nixosModules.sops

          {
            nixpkgs.overlays =
              let
                myoverlays = import ./overlays;
              in
              [
                inputs.dolphin-overlay.overlays.default
                inputs.nix-vscode-extensions.overlays.default
                inputs.misumisumi-flake.overlays.default
                myoverlays.overlays.default
              ];
          }

          ./machines/mars
          secrets.nixosModules.networks

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";

            home-manager.users.shreyas = import ./home/mars;

            home-manager.sharedModules = [
              inputs.hyprland.homeManagerModules.default
              inputs.catppuccin.homeModules.catppuccin
              inputs.plasma-manager.homeManagerModules.plasma-manager
              inputs.misumisumi-flake.homeManagerModules.default

              secrets.homeManagerModules.mars
              secrets.homeManagerModules.email-accounts
              secrets.homeManagerModules.music
            ];

            home-manager.extraSpecialArgs =
              let
                inherit (inputs) catppuccin;
              in
              {
                inherit
                  system
                  inputs
                  pkgs-unstable
                  mypkgs
                  catppuccin
                  ;
                gui = true; # TODO try to move this into `./home/mars/default.nix`
              };
          }
        ];
      };

      nixosConfigurations.roux = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit pkgs-unstable mypkgs; };

        modules = [
          inputs.nixos-hardware.nixosModules.hardkernel-odroid-h3

          {
            # IIRC this was for sonarr or radarr at some point
            nixpkgs.config.permittedInsecurePackages = [
              "dotnet-sdk-6.0.428"
              "aspnetcore-runtime-6.0.36"
            ];
          }

          ./machines/roux
          secrets.nixosModules.roux

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.sharedModules = [
              inputs.catppuccin.homeModules.catppuccin

              secrets.homeManagerModules.music
            ];

            home-manager.users.shreyas = import ./home/roux;

            home-manager.extraSpecialArgs = {
              inherit inputs pkgs-unstable mypkgs;
              gui = false;
            };
          }

          inputs.sops-nix.nixosModules.sops
        ];
      };

      homeConfigurations.shreyas-mars = home-manager.lib.homeManagerConfiguration {
        pkgs = [ ];
        modules = [ ./home/mars ];
      };

      homeConfigurations.shreyas-roux = home-manager.lib.homeManagerConfiguration {
        pkgs = [ ];
        modules = [ ./home/roux ];
      };

      nixOnDroidConfigurations.mercury = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./machines/mercury
        ];
      };
    };
}
