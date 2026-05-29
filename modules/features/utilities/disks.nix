{
  input,
  self,
  ...
}: {
  flake.modules.nixos.disks = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.gnome-disk-utility
    ];
  };
}
