{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.dsp = {
    imports = with self.modules.nixos; [
      plugins
      daw
    ];
  };
}
