{
  input,
  self,
  ...
}: {
  flake.modules.nixos.desktop = { config, pkgs, ... }: {
    programs.yazi.enable = true;
  };
}
