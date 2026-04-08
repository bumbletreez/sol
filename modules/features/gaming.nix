{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.gaming = {
    pkgs,
    ...
  }: {
    imports = [
    ];
    
    hardware.graphics.enable = true;

    programs.steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

  };
}
