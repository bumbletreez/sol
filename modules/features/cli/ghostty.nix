{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.ghostty = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
    ];

    hjem = {
      users.cassie = {
        files = {
          ".config/ghostty/config.ghostty".source = ./config.ghostty;
        };
      };
    };
  };
}
