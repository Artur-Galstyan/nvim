-- vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_refresh_rate = 120
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.g.copilot_assume_mapped = true
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.opt.swapfile = false
vim.opt.pumheight = 5


vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})

vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
  ["Find Under"] = "<C-g>",
  ["Select All"] = "<leader>A"
}
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.api.nvim_command "augroup python_auto"
vim.api.nvim_command "autocmd!"
vim.api.nvim_command "autocmd BufWritePre *.py silent! Neoformat ruff"
vim.api.nvim_command "augroup END"

vim.api.nvim_command("augroup Neoformat_auto")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWritePre *.ml,*.svelte silent! Neoformat")
vim.api.nvim_command("augroup END")

-- run :clearjumps on vim startup
vim.api.nvim_command("autocmd VimEnter * silent! clearjumps")
