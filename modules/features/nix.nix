{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.nix = { pkgs, ... }: {
    nixpkgs.overlays = [ (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena;
    }) ];

  nix.package = pkgs.lixPackageSets.stable.lix;
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = ["nix-command" "flakes"];
      };
    };
  };
}
