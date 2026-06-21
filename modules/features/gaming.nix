{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };

  flake.modules.nixos.gaming = {pkgs, ...}: {
    hardware.graphics.enable = true;

    nixpkgs.overlays = [
      inputs.millennium.overlays.default
    ];

    programs.steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      
      package = pkgs.millennium-steam;
    };


    environment.systemPackages = with pkgs; [
      protonup-qt
      sgdboop
      steam-tui
    ];
  };
}
