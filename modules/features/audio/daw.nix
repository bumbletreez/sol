{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.daw = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      reaper
      reaper-reapack-extension
      reaper-sws-extension
    ];

    fonts.packages = with pkgs; [
      fira-sans
      roboto
    ];
  };
}
