{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.bottles = {
    imports = [
      self.modules.nixos.flatpak
    ];

    services.flatpak.packages = [
      {
        appId = "com.usebottles.bottles";
        origin = "flathub";
      }
    ];
  };
}
