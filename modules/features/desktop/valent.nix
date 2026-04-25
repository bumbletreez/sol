{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.valent = { pkgs, ... }: {
    programs.kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };
  };
}
