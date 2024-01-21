return {
      "folke/which-key.nvim", -- TODO: need to set this up because I forget keybindings
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", -- Highlighting

    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "tsx", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
    "sainnhe/gruvbox-material", 
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim"
}
