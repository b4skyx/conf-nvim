---@diagnostic disable: undefined-global, unused-local

-- coc functions

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.show_documentation = function()
  if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
    vim.cmd([[execute 'h '.expand('<cword>')]])
  elseif vim.fn["coc#rpc#ready"]() then
    vim.cmd([[call CocActionAsync('doHover')]])
  else
    vim.cmd([[execute '!' . &keywordprg . " " . expand('<cword>')]])
  end
end

vim.cmd([[
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
]])

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["coc#refresh"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

_G.space_complete = function ()
    return vim.fn["coc#refresh"]()
end

local keymap = vim.api.nvim_set_keymap

-- Tab completion
keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Use <c-space> to trigger completion
keymap("i", "<C-Space>", "v:lua.space_complete()", {silent=true, expr=true})

-- General Keymappings
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent=true})
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent=true})

keymap("n", "gd", "<Plug>(coc-definition)", {silent=true})
keymap("n", "gt", "<Plug>(coc-type-definition)", {silent=true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent=true})
keymap("n", "gr", "<Plug>(coc-references)", {silent=true})

keymap("n", "K", "v:lua.show_documentation()", {expr=true})

-- Format code
keymap("n", "<leader>f", "<Plug>(coc-format)", {silent=true})
keymap("x", "<localleader>f", "<Plug>(coc-format-selected)", {silent=true})
keymap("n", "<localleader>f", "<Plug>(coc-format-selected)", {silent=true})

-- Diagnostics
keymap("n", "<localleader>d", ":<C-u>CocList diagnostics<CR>", {noremap= true, silent=true})

-- Code Action
keymap("x", "<localleader>a", "<Plug>(coc-codeaction-selected)", {silent=true})
keymap("n", "<localleader>a", "<Plug>(coc-codeaction-selected)", {silent=true})
keymap("n", "<localleader>a", ":<C-u>CocAction<CR>", {})
keymap("n", "<localleader>c", ":<C-u>CocCommand<CR>", {})

