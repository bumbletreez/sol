{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.greeter = {config, ...}: {
    services.displayManager.ly = {
      enable = false;
      settings = {
        animation = "matrix";        
      };
    };
  };
}
