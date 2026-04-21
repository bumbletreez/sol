{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.browser = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      chromium
    ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    programs = {
      firefox = {
        enable = true;
      };
    };
  };
}
