require("mason").setup({
	PATH = "prepend",
})
require("mason-null-ls").setup({
	handlers = {},
})
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspsaga").setup({
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
	},
	lightbulb = {
		enable = false,
	},
})

-- Diagnostics
vim.keymap.set({ "n", "v" }, "<localleader>a", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<localleader>d", "<cmd>Lspsaga show_buf_diagnostics<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<localleader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<localleader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Diagnostic jump
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[D", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]D", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- LSP
vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", { silent = true })
vim.keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "pt", "<cmd>Lspsaga peek_type_definition<CR>", { silent = true })

vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Flating Term
vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle fish<CR>")

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = {
				enable = true,
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

local servers = {
	-- many other servers
	"pyright",
	"rust_analyzer",
	"clangd",
}
for _, server in ipairs(servers) do
	lspconfig[server].setup({ capabilities = capabilities })
end

lspconfig.lemminx.setup({
	capabilities = capabilities,
	filetypes = { "arxml", "xml" },
})

if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<localleader>h", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "toggle inlay [h]ints" })
end
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = "LspAttach_inlayhints",
-- 	callback = function(args)
-- 		if not (args.data and args.data.client_id) then
-- 			return
-- 		end
--
-- 		local bufnr = args.buf
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		require("lsp-inlayhints").on_attach(client, bufnr)
-- 	end,
-- })
