{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.batteries = {
    services.upower.enable = true;
  };
}
