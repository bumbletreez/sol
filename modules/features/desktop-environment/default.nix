{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      niri
      noctalia
      icons
      cursors
      gtk
    ];
  };
}
