-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- material colorscheme settings
-- vim.g.material_style = 'deep ocean'
-- vim.g.material_italic_comments = true


-- gruvbox material settings
vim.g.gruvbox_material_background = 'hard'

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = 'gruvbox-material'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- LUALINE SETTINGS
local components = require("core.lualine.components")
local function idkFace()
  return [[\_(O_o)_/]]
end
lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.theme = 'gruvbox-material'
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.branch }
lvim.builtin.lualine.sections.lualine_c = { components.filename }
lvim.builtin.lualine.sections.lualine_x = {
  components.encoding,
  components.fileformat,
  components.filetype
}
lvim.builtin.lualine.sections.lualine_y = { 
  components.progress,
  components.spaces, 
}
lvim.builtin.lualine.sections.lualine_z = {
  components.location, 
  {idkFace}
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  {"marko-cerovac/material.nvim"},
  {"folke/tokyonight.nvim"},
  {"sainnhe/gruvbox-material"},
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
  },
  { "vimwiki/vimwiki", 
    config = function ()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/notes',
          syntax = 'markdown',
          index = 'index',
          ext = '.md',
        }
      }
    end
  },
  {
    "folke/trouble.nvim",
      cmd = "TroubleToggle",
  },
}
