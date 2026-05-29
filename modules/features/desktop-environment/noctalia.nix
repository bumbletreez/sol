{
  self,
  inputs,
  ...
}: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.nixos.noctalia = {
    pkgs,
    lib,
    ...
  }: {
    imports = with self.modules.nixos; [
      valent
    ];
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
