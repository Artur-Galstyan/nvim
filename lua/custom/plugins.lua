local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
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

  -- Install a plugin
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
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "InsertEnter",
  --   cmd = "Copilot",
  --   config = function()
  --     require("copilot").setup {
  --       panel = {
  --         auto_refresh = true,
  --         keymap = {
  --           accept = "<C-CR>",
  --         },
  --       },
  --       suggestion = {
  --         auto_trigger = false,
  --       },
  --     }
  --   end,
  -- },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      -- Your options go here
      name = { ".venv", "venv" },
      auto_refresh = false,
      search_venv_managers = true,
      search_workspace = true,
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      {
        -- Keymap to open VenvSelector to pick a venv.
        "<leader>vs",
        "<cmd>:VenvSelect<cr>",
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        "<leader>vc",
        "<cmd>:VenvSelectCached<cr>",
      },
    },
  },
}

return plugins
