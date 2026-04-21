{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.plugins = {pkgs, ...}: {
    imports = [
      self.modules.nixos.bottles
    ];

    environment.systemPackages = with pkgs; [
      #stuff for windows plugins
      yabridge
      yabridgectl
      winePackages.yabridge

      #linux native plugins
      odin2
      dexed
      surge-xt
      cardinal
      neural-amp-modeler-lv2
      openutau
    ];
  };
}
