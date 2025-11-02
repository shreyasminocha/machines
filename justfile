run: format check switch

switch:
  nh os switch --ask ~/flake

hm:
  home-manager switch --flake .#sminocha7-carlenny

check:
  statix check

format:
  nix fmt .

wipe-history:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
