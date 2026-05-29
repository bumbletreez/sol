{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.cli = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      nvf
      ghostty
      git
    ];
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
