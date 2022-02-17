-- packages
require('packer').startup(function()
  use 'nvim-lua/plenary.nvim'
  use 'burntsushi/ripgrep'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'glepnir/dashboard-nvim'
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/gruvbox-material'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tamago324/nlsp-settings.nvim'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'nvim-treesitter.configs'.setup {
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = "maintained",

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- List of parsers to ignore installing
      -- ignore_install = {},

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "c" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      }
    } end
  }
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/notes',
          syntax = 'markdown',
          index = 'index',
          ext = '.md',
        }
      }
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'terrortylor/nvim-comment',
    config = function () require'nvim_comment'.setup {} end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require'which-key'.setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)


