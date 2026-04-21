{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cursors = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      catppuccin-cursors
    ];
    xdg.icons.fallbackCursorThemes = ["catppuccin-cursors"];
  };
}
