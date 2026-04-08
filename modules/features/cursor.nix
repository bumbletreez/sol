{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cursors = {
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      catppuccin-cursors
    ];
    xdg.icons.fallbackCursorThemes = [ "catppuccin-cursors" ];
  };
}
