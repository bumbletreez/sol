{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.ghostty = {
    pkgs,
    ...
  }: {
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

