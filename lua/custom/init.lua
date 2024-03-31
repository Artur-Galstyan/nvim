vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.g.copilot_assume_mapped = true
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.opt.swapfile = false
vim.opt.pumheight = 5

-- Remaps for Mac
vim.api.nvim_command "nmap º <A-j>"
vim.api.nvim_command "nmap ∆ <A-k>"
vim.api.nvim_command "nmap Ø <A-O>"
vim.api.nvim_command "nmap ø <A-o>"
vim.api.nvim_command "nmap ª <A-h>"

vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
  ["Find Under"] = "<C-g>",
  ["Select All"] = "<leader>A",
  ["Add Cursor Down"] = "<A-j>",
  ["Add Cursor Up"] = "<A-k>",
}
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_enabled_python = { "ruff" }

vim.api.nvim_command "augroup fmt"
vim.api.nvim_command "autocmd!"
vim.api.nvim_command "autocmd BufWritePre * silent! Neoformat"
vim.api.nvim_command "augroup END"

-- run :clearjumps on vim startup
vim.api.nvim_command "autocmd VimEnter * silent! clearjumps"

-- set snippet path
vim.g.vscode_snippets_path = vim.fn.expand "~/.config/nvim/snippets"
vim.g.indent_blankline_show_current_context_start = false
