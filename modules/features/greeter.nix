{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.greeter = {
    config,
    ...
  }: {
    imports = [
      self.nixosModules.cursors
    ];

    programs.regreet = {
      enable = true;
      theme.name = "catppucin";
      font = {
        name = "Atkinson Hyperlegible Next";
        size = 16;
      };
      cursorTheme.name = "catppuccin-cursors";
    };
  };
}
