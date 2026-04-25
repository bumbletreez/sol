{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.gtk = {
    hjem.users.cassie.rum.misc.gtk.enable = true;
  };
}
