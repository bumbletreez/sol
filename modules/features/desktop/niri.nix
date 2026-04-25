{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    niri-nix.url = "git+https://codeberg.org/BANanaD3V/niri-nix";
  };
  flake.modules.nixos.niri = {pkgs, ...}: {
    imports = [
      inputs.niri-nix.nixosModules.default
    ];

    hjem = {
      users.cassie = {
        files = {
          ".config/niri/config.kdl".source = ./config.kdl;
        };
      };
    };

    programs.niri = {
      enable = true;
    };

    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.swaylock = {};

    xdg.portal.config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ]; # or "kde"
    };

    nixpkgs.overlays = [inputs.niri-nix.overlays.niri-nix];
    programs.niri.package = pkgs.niri-unstable;

    nix.settings = {
      substituters = [
        "https://niri-nix.cachix.org"
      ];
      trusted-public-keys = [
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      ];
    };
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
