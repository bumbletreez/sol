{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    imports = [
      self.nixosModules.niri
      self.nixosModules.noctalia
    ];

    programs.thunar.enable = true;
    programs.xfconf.enable = true;
  };
}
