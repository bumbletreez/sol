{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.sol = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      solConfig
      base
      greeter
      cassie
      dualboot
    ];


  };
}
