---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>ut"] = { ":UndotreeToggle<CR>" },
    ["<leader>zm"] = { ":ZenMode<CR>" },
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["Q"] = { "<nop>" },
    ["<leader>rs"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>" },
    ["<C-I>"] = { "<C-I>" },
    ["<C-Left>"] = { ":vertical resize -5<CR>" },
    ["<A-Left>"] = {":wincmd H<CR>"},
    ["<C-Right>"] = { ":vertical resize +5<CR>" },
    ["<A-Right>"] = { ":wincmd L<CR>"},
    ["<C-Up>"] = { ":resize +5<CR>" },
    ["<A-Up>"] = { ":wincmd K<CR>"},
    ["<C-Down>"] = { ":resize -5<CR>" },
    ["<A-Down>"] = { ":wincmd J<CR>"},
    ["<leader>cpe"] = { ":Copilot enable<CR>" },
    ["<leader>cpd"] = { ":Copilot disable<CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
  },
  x = {
    ["<leader>p"] = { '"_dP' },
  },
  i = {},
}

M.copilot = {
  i = {
    ["<C-CR>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>dc"] = { ":lua require('dap').continue()<CR>" },
--     ["<leader>ds"] = { ":lua require('dap').step_over()<CR>" },
--     ["<leader>di"] = { ":lua require('dap').step_into()<CR>" },
--     ["<leader>do"] = { ":lua require('dap').step_out()<CR>" },
--     ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>" },
--   }
-- }
--
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpr"] = {
--       function()
--         require("dap-python").test_method()
--       end
--     }
--   }
-- }

return M
