return {
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox-material")
	-- 	end,
	-- },
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		"kdheepak/tabline.nvim",
		config = function()
			require("configs.lualine")
		end,
		dependencies = { "nvim-lualine/lualine.nvim", "arkav/lualine-lsp-progress" },
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
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
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
	{ "neovim/nvim-lspconfig" },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},
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
		tag = "0.1.5",
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
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"mbbill/undotree",
	},
	"pteroctopus/faster.nvim",
	"dstein64/vim-startuptime",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		config = function()
			require("configs.copilot")
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
	"MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("inlay-hints").setup()
    end
}
