{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.utilities = {
    imports = with self.modules.nixos; [
      bottles
      cachix
      disks
      flatpak
      hjem
      nh
      nix
      xremap
    ];
  };
}
