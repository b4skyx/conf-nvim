return {
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"kdheepak/tabline.nvim",
		config = function()
			require("configs.lualine")
		end,
		dependencies = { "nvim-lualine/lualine.nvim" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "WhoIsSethDaniel/lualine-lsp-progress.nvim" },
	},
	"nvim-tree/nvim-web-devicons",
	-- { "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons"},
	"vimwiki/vimwiki",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("configs.null-ls")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Completion
	"onsails/lspkind.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"lvimuser/lsp-inlayhints.nvim",
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("configs.completions")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	-- LSP
	{ 'neovim/nvim-lspconfig' },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	"glepnir/lspsaga.nvim",
	{
		event = "LspAttach",
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("configs.nvimtree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = { "BufReadPre", "BufNewFile", "VimEnter" },
		config = function()
			require("configs.telescope")
		end,
		dependencies = { "nvim-telescope/telescope-project.nvim" },
	},
	{
		'simrat39/symbols-outline.nvim',
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require("ibl").setup()
		end,
	},
	{
		'mbbill/undotree'
	},
	"LunarVim/bigfile.nvim",
}
