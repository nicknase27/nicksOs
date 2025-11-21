{...}: {
  programs = {
    nvf = {
      enable = true;
      settings = {
        vim = {
          options = {
            number = true;
            relativenumber = true;
            showmode = false;
            confirm = true;

            tabstop = 2;
            shiftwidth = 2;
            autoindent = true;
            breakindent = true;
            undofile = true;

            wrap = false;
          };
          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };
          languages = {
            enableLSP = true;
            enableTreesitter = true;
            nix.enable = true;
            lua.enable = true;
          };

          searchCase = "smart";

          clipboard.registers = "unnamedplus";

          statusline.lualine.enable = true;
          autocomplete.nvim-cmp.enable = true;
          autopairs.nvim-autopairs.enable = true;
        };
      };
    };
  };
}
