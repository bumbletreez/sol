{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.discord = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vesktop
    ];
  };
}
