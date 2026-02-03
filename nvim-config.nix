{
  config.vim = {
    theme = {
      enable = true;
      name = "onedark";
      style = "darker";
      transparent = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "onedark";
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;

      nix.enable = true;
      markdown.enable = true;
      bash.enable = true;
    };

    notes.todo-comments.enable = true;

    options.mouse = "";

    spellcheck.enable = true;
  };
}
