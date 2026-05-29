{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.icons = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.fluent-icon-theme
    ];

    gtk.iconCache.enable = true;
  };
}
