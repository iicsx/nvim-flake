local packer = require('packer')

vim.cmd [[packadd packer.nvim]]

packer.init({
  display = {
    compact = false,
    prompt_border = "rounded",
    open_fn = function()
      return require('packer.util').float({
        border = "rounded",
      })
    end
  }
})

return packer.startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- git
  use('tpope/vim-fugitive')

  -- Tree Sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/nvim-treesitter-context', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use('onsails/lspkind.nvim')
  use('windwp/nvim-ts-autotag')

  -- File Management
  use('theprimeagen/harpoon')
  use("stevearc/oil.nvim")
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Undotree
  use('mbbill/undotree')

  -- Themes
  use('nyoom-engineering/oxocarbon.nvim')
  use('roflolilolmao/oceanic-next.nvim')
  use('AlexvZyl/nordic.nvim')
  use('rmehri01/onenord.nvim')
  use('olivercederborg/poimandres.nvim')
  use('Tsuzat/NeoSolarized.nvim')
  use('Yazeed1s/oh-lucy.nvim')

  use({
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "moon",
      })
    end,
  })

  -- Visual
  use("HiPhish/rainbow-delimiters.nvim")
  use('echasnovski/mini.indentscope')
  use('nvim-tree/nvim-web-devicons')
  use('xiyaowong/transparent.nvim')
  use('lewis6991/gitsigns.nvim')
  use('romgrk/barbar.nvim')
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
  use({
    'nvimdev/dashboard-nvim',
    requires = {
      'MaximilianLloyd/ascii.nvim',
    }
  })
  use("norcalli/nvim-colorizer.lua")

  -- Formatting
  use('elentok/format-on-save.nvim')
  use('MunifTanjim/prettier.nvim')
  use('m4xshen/autoclose.nvim')
  use('alvan/vim-closetag')

  -- Linting
  use("danarth/sonarlint.nvim")

  -- Markdown
  use({
    'MeanderingProgrammer/markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })
  use("oflisback/obsidian-bridge.nvim")
  use("coddingtonbear/obsidian-local-rest-api")
  use("epwalsh/obsidian.nvim")

  -- MISC --
  use("diepm/vim-rest-console")

  -- Git integration
  use("iicsx/gint-nvim")

  -- AI Integration
  use("robitx/gp.nvim")
  use('github/copilot.vim')
end)
