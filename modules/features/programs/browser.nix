{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.nixos.browser = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.chromium
    ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    programs = {
      firefox = {
        enable = true;
      };
    };
  };
}
