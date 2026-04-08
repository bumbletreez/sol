{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.fonts = {
  }: {
    pkgs,
    ...
  }: {
    fonts.packages = with pkgs; [
      atkinson-hyperlegible-next
      atkinson-hyperlegible-mono
      noto-fonts-color-emoji
    ];
  };
}
