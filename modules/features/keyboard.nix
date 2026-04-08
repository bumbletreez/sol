{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.keyboard = {
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      vial
      qmk-udev-rules
    ];
    services.udev.packages = [
      pkgs.vial
      pkgs.qmk-udev-rules
    ];
  };
}
