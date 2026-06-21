{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.greeter = {config, ...}: {
    services.displayManager.cosmic-greeter.enable = true;
  };
}
