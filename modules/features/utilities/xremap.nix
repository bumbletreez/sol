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
      inputs.xremap.nixosModules.default
    ];
    services.xremap = {
      enable = true;
      package = pkgs.xremap;
      userName = "cassie";
      withNiri = true;
      serviceMode = "user";
      deviceNames = [ "Razer Tartarus Pro Keyboard" ];
      yamlConfig = ''
        modmap:
          - name: Razer fixes
            remap:
              LeftShift: LeftCtrl
              CapsLock: LeftShift
              1: Esc
              2: "1"
              3: "2"
              4: "3"
              5: "4"
      '';
    };
  };
}
