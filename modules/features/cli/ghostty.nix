{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.ghostty = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
    ];

  };
}
