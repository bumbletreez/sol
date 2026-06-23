{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cli = {
    hjem.users.cassie.rum.programs.nushell = {
      enable = true;
    };
  };
}
