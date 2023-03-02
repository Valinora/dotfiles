return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'onedark',
      }
    }
  },
  {'navarasu/onedark.nvim', config = true},

  {
    'folke/neodev.nvim',
    config = true
  },

  -- TODO: Get rid of lsp-zero, do everything myself
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
  },

  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      {'jose-elias-alvarez/null-ls.nvim', config = true},
    'nvim-lua/plenary.nvim'
    },
    opts = {
      automatic_setup = true
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim'
  },

  {
    'folke/trouble.nvim',
    config = true
  },

  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = true
  },

  'mattn/emmet-vim',
  {'lewis6991/gitsigns.nvim', dependencies = 'nvim-lua/plenary.nvim', opts = true},
  'ap/vim-css-color',
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {
        side = "right"
      }
    }
  },
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
}
