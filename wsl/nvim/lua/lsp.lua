-- ~/.config/nvim/lua/lsp.lua

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local bufmap = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end
  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

if vim.lsp.config and vim.lsp.start then
  vim.lsp.config.pyright = {
    default_config = {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }),
      capabilities = capabilities,
      on_attach = on_attach,
    },
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      vim.lsp.start(vim.lsp.config.pyright.default_config)
    end,
  })
else
  local lspconfig = require("lspconfig")
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
