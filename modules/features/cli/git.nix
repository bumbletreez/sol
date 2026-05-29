{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.git = {pkgs, ...}: {
    hjem.users.cassie.rum.programs.git = {
      enable = true;
      settings = {
        user = {
          email = "cassievaupel@gmail.com";
          name = "cassie";
        };
      };
    };
  };
}
