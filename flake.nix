{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    import-tree.url = "github:vic/import-tree";
    
    flake-parts.url = "github:hercules-ci/flake-parts";
    
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    niri-nix.url = "git+https://codeberg.org/BANanaD3V/niri-nix";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix.url = "github:musnix/musnix";

    xremap.url = "github:xremap/nix-flake";

    hjem = {
      follows = "hjem-rum/hjem";
    };

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; }
   (inputs.import-tree ./modules);
}
