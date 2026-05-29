{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.programs = {
    imports = with self.modules.nixos; [
      browser
      discord
      grayjay
      ytmusic
    ];
  };
}
