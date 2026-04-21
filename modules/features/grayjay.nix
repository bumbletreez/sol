{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.grayjay = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      grayjay
    ];
  };
}
