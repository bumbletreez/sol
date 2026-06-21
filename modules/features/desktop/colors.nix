{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  flake.modules.nixos.colors = {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
    
    catppuccin = {
      enable = true;
      accent = "lavender";
      autoEnable = true;
      flavor = "mocha";
    };

  };
}
