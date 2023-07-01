local null_ls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq" },
})

require("mason").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
})

-- will setup any installed and configured sources above
null_ls.setup()
vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format({ async = true })
end, {})
