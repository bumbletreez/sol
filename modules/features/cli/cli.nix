{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.cli = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
