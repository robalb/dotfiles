local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- servers to autoinstall via mason-lspconfig
lspconfig.servers = {
    "lua_ls",
    "clangd",
    "gopls",
    "pyright",
    "astro",
    "cssls",
    -- see also: ansiblelint. somehow it is required
    -- https://ansible.readthedocs.io/projects/lint/installing/#installing-the-latest-version
    "ansiblels", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels
    -- json, css, svelte, js, ts, tsx... kinda experimental. consider eslint as an alternative.
    "biome", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels
}

-- list of servers configured with default config.
local default_servers = {
    "clangd",
    "lua_ls",
    "gopls",
    "ansiblels",
    "astro",
    "cssls",
    "biome",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- For non-default configs, here are some examples:
-- https://github.com/ProgrammingRainbow/NvChad-2.5/blob/main/lua/configs/lspconfig.lua
--
-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     -- https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/settings.md
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })
