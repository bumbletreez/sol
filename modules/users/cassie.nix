{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.cassie = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      git
    ];
    users.users.cassie = {
      isNormalUser = true;
      description = "cassie";
      extraGroups = ["networkmanager" "wheel" "audio"];
      packages = with pkgs; [
      ];
    };
    hjem = {
      users.cassie = {
        enable = true;
        directory = "/home/cassie";
        user = "cassie";
      };
    };
  };
}
