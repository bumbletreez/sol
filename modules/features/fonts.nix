{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.fonts = {}: {pkgs, ...}: {
    fonts.packages = with pkgs; [
      atkinson-hyperlegible-next
      atkinson-hyperlegible-mono
      noto-fonts-color-emoji
    ];
  };
}
