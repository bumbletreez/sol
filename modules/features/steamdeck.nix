{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.steamdeck = {
    imports = [
      inputs.jovian-nixos.nixosModules.default
    ];

    jovian.steam = {
      enable = true;
      autoStart = true;
      desktopSession = "niri";
      user = "cassie";
    };
  };
}
