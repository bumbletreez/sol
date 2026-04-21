{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.gaming = {pkgs, ...}: {
    hardware.graphics.enable = true;

    programs.steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    environment.systemPackages = with pkgs; [
      protonup-qt
    ];
  };
}
