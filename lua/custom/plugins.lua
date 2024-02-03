local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      require("core.utils").load_mappings "dap_python"
      require("dap-python").setup "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    end,
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
