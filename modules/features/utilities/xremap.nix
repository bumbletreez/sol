{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    xremap.url = "github:xremap/nix-flake";
  };

  flake.modules.nixos.xremap = { pkgs, ... }: {
    imports = [
      inputs.xremap-flake.nixosModules.default
    ];
    services.xremap = {
      enable = true;
      package = pkgs.xremap;
      username = "cassie";
      withNiri = true;
      serviceMode = "user";
      deviceNames = [ "Razer Tartarus Pro Keyboard" ];
      yamlConfig = ''
        modmap:
          - name: Razer fixes
            remap:
              LeftShift: LeftCtrl
              CapsLock: LeftShift
      '';
    };
  };
}
