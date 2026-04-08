{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cassie = { pkgs, ... }: {
    imports = with self.nixosModules; [
      git
    ];
    users.users.cassie = {
      isNormalUser = true;
      description = "cassie";
      extraGroups = [ "networkmanager" "wheel" "audio"];
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
