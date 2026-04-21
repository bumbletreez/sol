{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    hjem = {
      follows = "hjem-rum/hjem";
    };

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.hjem = {
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
