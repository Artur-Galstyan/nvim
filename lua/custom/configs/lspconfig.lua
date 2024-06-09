local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "svelte", "ruff", "pyright", "astro", "gdscript" }

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig[lsp].setup(config)
end

lspconfig.ruff.setup {
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
  capabilities = capabilities,
}

-- Python
capabilities.textDocument.publishDiagnostics.tagSupport = { valueSet = { 2 } }
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      autoImportCompletion = true,
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
        -- autoSearchPaths = true,
        -- stubPath = "~/.typings/",
        -- diagnosticMode = "workspace",
        -- typeCheckingMode = "basic",
        -- diagnosticSeverityOverrides = {
        --   reportGeneralTypeIssues = "none",
        --   reportUnusedImport = "none",
        --   reportUnknownMemberType = "none",
        --   reportFunctionMemberAccess = "none",
        --   reportPrivateImportUsage = "none",
        --   reportMissingTypeStubs = "none",
        --   reportAttributeAccessIssue = "none",
        -- },
      },
    },
  },
}
