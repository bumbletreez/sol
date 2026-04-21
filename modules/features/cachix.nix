{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cachix = {
    nix = {
      settings = {
        substituters = [
          "https://nix-community.cachix.org"
        ];
      };
    };
  };
}
