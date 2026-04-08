{
  pkgs,
  inputs,
  ...
}: {
  flake.nixosModules.nvf = {
    imports = [ inputs.nvf.nixosModules.default ];
    
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
	  lsp = {
	    enable = true;
	  };
	  lazy.enable = true;
	  languages.nix.enable = true;
	  treesitter.grammars = [
	    pkgs.vimPlugins.nvim-treesitter.allGrammmars
	  ];
          autocomplete = {
            blink-cmp.enable = true;
          };

        };
      };
    };
  };
}

