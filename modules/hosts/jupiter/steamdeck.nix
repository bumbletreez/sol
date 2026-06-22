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

  flake.modules.nixos.steamdeck = {pkgs, lib, ...}: {
    imports = [
      inputs.jovian-nixos.nixosModules.default
      self.modules.nixos.audio
    ];

    musnix.kernel.packages = pkgs.linuxPackages_jovian;

    jovian = {
      steam = {
        enable = true;
        autoStart = true;
        desktopSession = "niri";
        user = "cassie";
        updater.splash = "jovian";
      };
      devices.steamdeck = {
        enable = true;
        autoUpdate = true;
        enableVendorDrivers = true;
      };
      hardware.has.amd.gpu = true;
    };
    services.udev.packages = [
      pkgs.jupiter-hw-support
    ];
  };
}
