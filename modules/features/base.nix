{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.base = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      desktop
      dsp
      nh
      nvf
      cachix
      ghostty
      browser
      keyboard
      discord
      flatpak
      grayjay
      ytmusic
      hjem
      gaming
      nix
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.ark
    ];
    system.systemBuilderCommands = "ln -s ${self.sourceInfo.outPath} $out/src";
  };
}
