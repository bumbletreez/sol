{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.hjem = {
    
    imports = [
      inputs.hjem.nixosModules.default
    ];

    hjem = {
      extraModules = [
        inputs.hjem-rum.hjemModules.default
      ];
      clobberByDefault = true;
    };
  };
}
