{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.system = {
    services.power-profiles-daemon.enable = true;
  };
}
