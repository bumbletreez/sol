{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.smartphone = { pkgs, ... }: {
    programs.kdeconnect = {
      enable = true;
    };
  };
}
