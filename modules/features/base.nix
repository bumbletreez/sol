{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.base = {
    pkgs,
    ...
  }: {
    imports = with self.nixosModules; [
      desktop
      nh
      nvf
      cachix
      ghostty
      browser
      keyboard
      audio
      discord
      flatpak
      grayjay
      ytmusic
      hjem
      gaming
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.ark
    ];
    system.systemBuilderCommands = "ln -s ${self.sourceInfo.outPath} $out/src";
  };
}
