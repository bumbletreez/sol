{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.base = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      desktop
      audio
      dsp
      programs
      keyboard
      gaming
      cli
      utilities
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.ark
      musescore
    ];
    system.systemBuilderCommands = "ln -s ${self.sourceInfo.outPath} $out/src";
  };
}
