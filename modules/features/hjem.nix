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
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      # these are only required for internal tests,
      # hence you can set em to nothing
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
  };

  flake.modules.nixos.hjem = {
    imports = [
      inputs.hjem.nixosModules.default
    ];

    hjem = {
      extraModules = [
        inputs.hjem-rum.hjemModules.default
        inputs.hjem-impure.hjemModules.default
      ];
      clobberByDefault = true;
    };
  };
}
