{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cassie = {pkgs, config, ...}: {
    imports = with self.modules.nixos; [
      git
    ];
    users.users.cassie = {
      isNormalUser = true;
      description = "cassie";
      extraGroups = [ "networkmanager" "wheel" "audio" "realtime" ];
      packages = with pkgs; [
      ];
    };
    hjem = {
      users.cassie = {
        enable = true;
        directory = "/home/cassie";
        user = "cassie";
        impure = {
          enable = true;
          dotsDir = "${./dots}";
          dotsDirImpure = "/home/cassie/nixos-config/modules/users/cassie/dots";
        };
        xdg.config.files = let
          dots = config.hjem.users.cassie.impure.dotsDir;
        in {
          "niri/config.kdl".source = dots + "/config.kdl";
          "ghostty/config.ghostty".source = dots + "/config.ghostty";
        };
      };
    };
  };
}
