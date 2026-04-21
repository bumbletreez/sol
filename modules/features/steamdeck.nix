{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.steamdeck = {pkgs, ...}: {
    imports = [
      inputs.jovian-nixos.nixosModules.default
    ];

    jovian = {
      steam = {
        enable = true;
        autoStart = true;
        desktopSession = "niri";
        user = "cassie";
        updater.splash = true;
      };
      devices.steamdeck = {
        enable = true;
        autoUpdate = true;
        has.amd.gpu = true;
        enableVendorDrivers = true;
      };
      services.udev.packages = [
        pkgs.jupiter-hw-support
      ];
    };
  };
}
