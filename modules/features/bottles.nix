{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.bottles = {

    services.flatpak.packages = [
      {
        appId = "com.usebottles.bottles";
        origin = "flathub";
      }
    ];
  };
}
