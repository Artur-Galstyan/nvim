local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "sbdchd/neoformat",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "mbbill/undotree",
    init = function()
      require("core.utils").lazy_load "undotree"
    end,
    cmd = { "UndotreeToggle" },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function() end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = {
      pluins = {
        wezterm = { enabled = true },
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      floating_window = false,
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}

return plugins
