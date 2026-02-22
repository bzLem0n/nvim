{
  inputs,
  self,
  ...
}: {
  perSystem = {pkgs, ...}: let
    customNeovim = inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        ./nvim-config.nix
      ];
    };
  in {
    packages.default = customNeovim.neovim;
  };
}
