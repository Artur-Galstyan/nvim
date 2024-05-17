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
    ["<C-I>"] = { "<C-I>" },
    ["<C-Left>"] = { ":vertical resize -5<CR>" },
    ["<A-Left>"] = { ":wincmd H<CR>" },
    ["<C-Right>"] = { ":vertical resize +5<CR>" },
    ["<A-Right>"] = { ":wincmd L<CR>" },
    ["<C-Up>"] = { ":resize +5<CR>" },
    ["<A-Up>"] = { ":wincmd K<CR>" },
    ["<C-Down>"] = { ":resize -5<CR>" },
    ["<A-Down>"] = { ":wincmd J<CR>" },
    ["<leader>cpe"] = { ":Copilot enable<CR>" },
    ["<leader>cpd"] = { ":Copilot disable<CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
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
