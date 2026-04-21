{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.greeter = {config, ...}: {
    imports = [
      self.modules.nixos.cursors
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
