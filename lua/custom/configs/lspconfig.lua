local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "svelte", "ruff_lsp", "pyright" }

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "pyright" then
    config.settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "none",
            reportIncompatibleVariableOverride = "none",
          },
        },
      },
    }
  end

  lspconfig[lsp].setup(config)
end
