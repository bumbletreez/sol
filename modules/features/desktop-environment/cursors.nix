{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cursors = {pkgs, ...}: {
    xdg.icons.fallbackCursorThemes = ["catppuccin-mocha-dark-cursors"];
    users.users.cassie.packages = [
      pkgs.catppuccin-cursors.mochaDark
    ];
    hjem.users.cassie.rum.misc.gtk = {
      packages = [
        pkgs.catppuccin-cursors.mochaDark
      ];
      settings = {
        cursor-theme-name = "catppuccin-mocha-dark-cursors";
      };
    };
  };
}
