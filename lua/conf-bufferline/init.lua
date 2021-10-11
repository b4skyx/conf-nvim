vim.o.termguicolors = true

-- colors for active , inactive buffer tabs
require "bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        separator_style = "thin"
    },
    highlights = {
        background = {
            guifg = comment_fg,
            guibg = "#2a2f33"
        },
        fill = {
            guifg = comment_fg,
            guibg = "#2a2f33"
        },
        buffer_selected = {
            guifg = normal_fg,
            guibg = "#373d41",
            gui = "bold"
        },
        separator_visible = {
            guifg = "#2a2f33",
            guibg = "#2a2f33"
        },
        separator_selected = {
            guifg = "#2a2f33",
            guibg = "#2a2f33"
        },
        separator = {
            guifg = "#2a2f33",
            guibg = "#2a2f33"
        },
        indicator_selected = {
            guifg = "#2a2f33",
            guibg = "#2a2f33"
        },
        modified_selected = {
            guifg = string_fg,
            guibg = "#373d41"
        }
    }
}
local opts = {silent = true}
keymap=vim.api.nvim_set_keymap
keymap('', '<Tab>',  ':BufferLineCycleNext<CR>', opts)
keymap('', '<S-Tab>',  ':BufferLineCyclePrev<CR>', opts)
keymap('', '<C-c>',  ':bd<CR>', opts)
-- keymap('', '<C-t>',  ':tabnew<CR>', opts)
