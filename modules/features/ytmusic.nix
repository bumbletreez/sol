{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.ytmusic = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      pear-desktop
    ];
  };
}
