{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.greeter = {config, ...}: {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";        
      };
    };
  };
}
