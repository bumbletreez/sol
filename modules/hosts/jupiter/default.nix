{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.jupiter = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      jupiterConfig
      base
      steamdeck
      cassie
    ];
  };
}
