run: format check switch

switch:
  nh os switch --ask ~/flake

check:
  statix check

format:
  nix fmt .

wipe-history:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
