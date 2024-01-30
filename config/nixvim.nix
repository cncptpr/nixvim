{ pkgs, ... }:

{
  config = {
    colorschemes.catppuccin.enable = true;

    options = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
      autowrite = true;
      autowriteall = true;
    };

    globals.mapleader = " ";

    keymaps = [
      # save
      { action = "<cmd>w<CR>"; key = "C-s"; mode = [ "n" ]; }
      { action = "<cmd>wa<CR>"; key = "C-S-S"; mode = [ "n" ]; }

      # Git
      { action = "<cmd>Neogit<CR>"; key = "<leader>gu"; }
      {
        action = "<cmd>GitGutterToggle<CR><cmd>GitBlameToggle<CR>";
        key = "<leader>gt";
      }

      # Telescope Pickers
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }

      # flash
      {
        action = "<cmd>lua require(\"flash\").jump()<CR>";
        key = "s";
        mode = [ "n" "o" "x" ];
      }


      # Uniform return to normal
      { action = "<C-\\><C-n>"; key = "<C-x>"; mode = [ "n" "i" "t" ]; }

      #  NvimTree
      {
        action = "<cmd>NvimTreeFindFile<CR>";
        key = "<leader>tt";
      }
      {
        action = "<cmd>NvimTreeClose<CR>";
        key = "<leader>tc";
      }

      # Buffer Navigation
      {
        action = "<C-\\><C-n><C-w>h";
        key = "<A-h>";
        mode = [ "n" "i" "t" ];
      }
      {
        action = "<C-\\><C-n><C-w>j";
        key = "<A-j>";
        mode = [ "n" "i" "t" ];
      }
      {
        action = "<C-\\><C-n><C-w>k";
        key = "<A-k>";
        mode = [ "n" "i" "t" ];
      }
      {
        action = "<C-\\><C-n><C-w>l";
        key = "<A-l>";
        mode = [ "n" "i" "t" ];
      }

      # Clear highlights
      {
        action = "<cmd>nohl<CR>";
        key = "<ESC>";
        mode = [ "n" ];
      }
    ];

    autoCmd = [
      { event = [ "VimEnter" ]; command = ":GitBlameDisable"; }
    ];

    plugins = {
      auto-session.enable = true;
      ## Does this change anything compared to navic?
      # barbecue.enable = true;
      better-escape = {
        enable = true;
        mapping = [ "jk" "kj" ];
      };
      comment-nvim.enable = true;
      cursorline.enable = true;
      dap.enable = true;
      debugprint.enable = true;
      diffview.enable = true;
      endwise.enable = true; # Todo does it work with bash in strings?
      fidget.enable = true; # clash with noice?? Does noice have lsp stuff?
      floaterm.enable = true;

      gitblame.enable = true;
      gitgutter = {
        enable = true;
        enableByDefault = false;
      };

      goyo.enable = true; # Distractionfree writing
      hardtime.enable = true;
      # Figure out how this works
      harpoon = {
        enable = true;
        enableTelescope = true;
        keymaps = {
          addFile = "<leader>ha";
          cmdToggleQuickMenu = "<leader>ht";
          gotoTerminal = {
            "1" = "C-M-B";
            "2" = "C-M-N";
            "3" = "C-M-M";
          };
        };
      };
      hmts.enable = true; # Coloring Code in String for nix homemanager
      inc-rename.enable = true; # lsp renaming preview
      # indent-blankline.enable = true; # Draws lines to visualize indentation
      intellitab.enable = true; # only press tab once for the right indentation
      # remembers last edit position for file 
      # (auto session only remembers for buffers saved in the session)
      lastplace.enable = true;
      lsp = {
        enable = true;
        servers = {
          rnix-lsp.enable = true;
        };
      };
      lsp-format.enable = true; # Autoformat on save with lsp
      lsp-lines.enable = true; # Displays Lsp warnings in virtual lines
      # Icons in cmp for lsp items
      lspkind = {
        enable = true;
        cmp.enable = true;
      };
      # luasnip.enable = true; # Todo see how it works
      # markdown-preview.enable = true # Try out when not in wsl
      # mkdnflow.enable = true # Incase I ever have a md wiki
      multicursors.enable = true; # Todo Figure out how to use!
      ## Seems nice, but doesn't work
      # navbuddy = {
      #   enable = true;
      #   lsp.autoAttach = true;
      # };
      navic = {
        enable = true;
        lsp.autoAttach = true;
      };

      ## Code / Function Documentation generator. Am I using it?
      neogen = {
        enable = true;
        keymaps = {
          generateFile = "<leader>nf";
          generateFunction = "<leader>nm";
          generateClass = "<leader>nc";
          generateType = "<leader>nt";
          generate = "<leader>ng";
        };
      };
      neogit.enable = true;
      nix.enable = true;
      ## Start nix shells or DEs from within nvim
      nix-develop.enable = true;
      none-ls.enable = true;
      notify.enable = true;
      nvim-autopairs.enable = true;
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "crates"; }
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
      ## Is this good with Rust/Java/etc Syntax or only CSS/Hex?
      nvim-colorizer.enable = true;
      ## Java lsp stuff
      # nvim-jdtls.enable = true;
      ## Adds a lot of lightbulbs
      nvim-lightbulb.enable = true;
      nvim-tree = {
        enable = true;
        autoClose = true;
        hijackCursor = true;
        hijackUnnamedBufferWhenOpening = true;
        view.side = "right";
        updateFocusedFile.enable = true;
      };
      ## Am I ever going to use it? 
      obsidian.enable = true;
      quickmath.enable = true;
      rainbow-delimiters.enable = true;
      ## Do I want it?
      refactoring.enable = true;
      ## Maked line blink when cursor moves
      specs.enable = true;
      surround.enable = true;
      ## Sounds nice but Homemanager throws some error when enabled
      # tagbar.enable = true;
      telescope.enable = true;
      todo-comments.enable = true;
      # TODO do I even need floaterm?
      toggleterm.enable = true;
      # TODO check what accompaining plugins do
      treesitter.enable = true;
      trouble.enable = true;
      ## Makes commenting work in multi-lang files.
      ts-context-commentstring.enable = true;
      ## Jump with % on text object, not only on single characters like { to }
      vim-matchup.enable = true;
      ## If i ever need LaTeX again
      # vimtex.enable = true;
      vimtex.enable = true;
      ## Some stuff with command tab preview
      wilder.enable = true;
      which-key.enable = true;

      # TODO configure
      yanky.enable = true;


      # Unsorted

      flash = {
        enable = true;
        jump.autojump = true;
      };
      lualine.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];

    extraPackages = with pkgs; [
      ripgrep
    ];
  };
}

