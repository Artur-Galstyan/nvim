local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "ü", -- set to `false` to disable one of the mappings
            node_incremental = "ü",
            scope_incremental = "grc",
            node_decremental = "ä",
        },
    },

  indent = { enable = true },
}

return options
