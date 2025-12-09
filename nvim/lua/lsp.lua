local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end)

local on_attach = function(_, bufnr)
    local nmap = function(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr })
    end

    nmap("gd", vim.lsp.buf.definition)
    nmap("K", vim.lsp.buf.hover)
    nmap("<leader>rn", vim.lsp.buf.rename)
    nmap("<leader>ca", vim.lsp.buf.code_action)
end

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
