{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nix = { 
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
      };
    };
  };
}
