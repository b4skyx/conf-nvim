-- Load Defaults
require('settings')
require('colorscheme')


-- Load plugins asynchronously
local async
async =
   vim.loop.new_async(
   vim.schedule_wrap(
	function()
	require('keymappings')
	require('conf-galaxyline')
	require('conf-bufferline')
	require('conf-colorizer')
	require('conf-hop')
	require('conf-gitsigns')
	require('conf-nvimtree')
	require('conf-coc')
	require('conf-telescope')
	require("conf-indentline")

	-- Setup Plugin Defaults
	require('kommentary.config').use_extended_mappings()
	async:close()
  end
  )
)
async:send()


-- Nvim lsp config if you'd want it
--[[ require('conf-lspconfig')
require('conf-compe') ]]
