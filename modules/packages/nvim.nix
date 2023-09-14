{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs; [
      vimPlugins.vim-nix
      vimPlugins.plenary-nvim
      vimExtraPlugins.nvim-transparent
      {
        plugin = vimPlugins.impatient-nvim;
        config = "lua require('impatient')";
      }
      {
        plugin = vimPlugins.lualine-nvim;
        config = "lua require('lualine').setup()";
      }
      {
        plugin = vimPlugins.telescope-nvim;
        config = "lua require('telescope').setup()";
      }
      {
        plugin = vimPlugins.indent-blankline-nvim;
        config = "lua require('indent_blankline').setup()";
      }
      {
        plugin = vimPlugins.nvim-lspconfig;
        config = ''
          lua << EOF
          require('lspconfig').rust_analyzer.setup{}
          require('lspconfig').lua_ls.setup{}
          require('lspconfig').rnix.setup{}
          require('lspconfig').zk.setup{}
          EOF
        '';
      }
      {
        plugin = vimPlugins.nvim-treesitter;
        config = ''
          lua << EOF
          require('nvim-treesitter.configs').setup {
              highlight = {
                  enable = true,
                  additional_vim_regex_highlighting = false,
              },
          }
          EOF
        '';
      }
      {
        plugin = vimPlugins.catppuccin-nvim;
        config = ''
              lua << EOF
              require("catppuccin").setup({
              flavour = "mocha",
              transparent_background = true,
              term_colors = false,
              })
              vim.cmd.colorscheme "catppuccin"

          EOF
        '';
      }
    ];

  };
}
