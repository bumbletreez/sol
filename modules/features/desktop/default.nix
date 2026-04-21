{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      niri
      noctalia
    ];

    programs.thunar.enable = true;
    programs.xfconf.enable = true;
  };
}
