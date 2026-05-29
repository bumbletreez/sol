{
  input,
  self,
  ...
}: {
  flake.modules.nixos.desktop = { config, pkgs, ... }: {
    
    programs.yazi.enable = true;

    services.udisks2.enable = true;

    services.gvfs.enable = true;
    
    environment.systemPackages = [ 
      pkgs.nautilus
      pkgs.libheif 
      pkgs.libheif.out 
      ];

    environment.pathsToLink = [ "share/thumbnailers" ];
    
    nixpkgs.overlays = [
      (final: prev: {
        nautilus = prev.nautilus.overrideAttrs (nprev: {
          buildInputs =
            nprev.buildInputs
            ++ (with pkgs.gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      })
    ];
  };
}
