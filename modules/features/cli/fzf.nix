{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.cli = { pkgs, ... }: {
    hjem.users.cassie.rum.programs = {
      fzf = {
        enable = true;
      };
    };
  };
}
