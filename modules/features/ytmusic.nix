{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.ytmusic = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pear-desktop
    ];
  };
}
