{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cachix = {
  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
      ];
    };
  };
};
}
