{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-lib.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs-lib";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.flake-parts.follows = "flake-parts";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    nvf.inputs.systems.follows = "systems";

    systems.url = "github:nix-systems/default";
  };

  outputs = {nixpkgs, ...} @ inputs: {
    packages.x86_64-linux = {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            {
              config.vim = {
                # Enable custom theming options
                theme.enable = true;

                # Enable Treesitter
                treesitter.enable = true;

                # Other options will go here. Refer to the config
                # reference in Appendix B of the nvf manual.
                # ...
              };
            }
          ];
        })
        .neovim;
    };
  };
}