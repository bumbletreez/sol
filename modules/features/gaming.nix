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
      package = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          catppuccin-cursors.mochaDark
        ];
    };

    };
    environment.systemPackages = with pkgs; [
      protonup-qt
    ];
  };
}
