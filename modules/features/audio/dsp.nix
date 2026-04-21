{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.dsp = {
    imports = with self.modules.nixos; [
      audio
      plugins
      daw
    ];
  };
}
