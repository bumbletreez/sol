{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.grayjay = {pkgs, ...}: {
    services.flatpak.packages = [
      {
        appId = "app.grayjay.Grayjay";
        origin = "flathub";
      }
    ];
  };
}
