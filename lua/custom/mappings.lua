---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>ut"] = { ":UndotreeToggle<CR>" },
    ["<leader>zm"] = { ":ZenMode<CR>" },
    ["ö"] = { ":bd<CR>:bn<CR>" },
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["Q"] = { "<nop>" },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>" },
    ["<C-I>"] = { "<C-I>" },
    ["<C-Left>"] = { ":vertical resize +5<CR>" },
    ["<C-Right>"] = { ":vertical resize -5<CR>" },
    ["<C-Up>"] = { ":resize -5<CR>" },
    ["<C-Down>"] = { ":resize +5<CR>" },
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

return M
