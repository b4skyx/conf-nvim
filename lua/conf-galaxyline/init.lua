require'nvim-web-devicons'.setup()

local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')

gl.short_line_list = {"vista", "NvimTree", " "}

local colors = {
  bg = '#2a2f33',
  bg1 = '#2e3338',
  bg2 = '#31363b',
  bg3 = '#373d41',
  bg_visual = "#474F54",
  fg = '#bfddb2',
  yellow = '#c1bf89',
  cyan = '#88b482',
  darkblue = '#415c6d',
  green = '#acb765',
  orange = '#e5a46b',
  purple = '#d39bb6',
  magenta = '#b18a97',
  grey = '#7f868c',
  blue = '#7daea3',
  red = '#ea5252'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 50 then
    return true
  end
  return false
end


local bufficon = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
    local mode_text = {
		n      = "  NORMAL ",
    i      = "  INSERT ",
    v      = "  VISUAL ",
    [''] = "  VISUAL ",
    V      = "  VISUAL ",
    c      = "  COMMAND ",
    no     = "  NORMAL ",
    s      = "  VISUAL ",
    S      = "  VISUAL ",
    [''] = "  VISUAL ",
    ic     = "  VISUAL ",
    R      = "  VISUAL ",
    Rv     = "  VISUAL ",
    cv     = "  VISUAL ",
    ce     = "  VISUAL ",
    r      = "  VISUAL ",
    rm     = "  VISUAL ",
    ['r?'] = "  VISUAL ",
    ['!']  = "  VISUAL ",
    t      = "  TERMINAL "
    }

    local mode_color = {n = colors.green,
    i = colors.magenta,
    v = colors.blue,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.purple,
    no = colors.magenta,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.red,
    Rv = colors.red,
    cv = colors.red,
    ce=colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.red,
    t = colors.red}
    vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
    vim.api.nvim_command('hi GalaxyPerCent guibg='..mode_color[vim.fn.mode()])
    return mode_text[vim.fn.mode()]
  end,
  separator = ' ',
  separator_highlight = {colors.bg3,function()
    if not buffer_not_empty() then
      return colors.bg1
    end
    return colors.bg3
  end},
  highlight = {colors.bg,colors.bg,'bold'},
}
}

-- Status Modules

local filename = {
  FileName = {
    -- provider = 'FileName',
    provider = function()
      return vim.fn.expand("%:t")
    end,
    condition = condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.gray,colors.bg3},
    highlight = {colors.fg,colors.bg3, 'bold'}
  }
}

local basedir = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        highlight = {colors.grey, colors.bg1},
        separator = " ",
        separator_highlight = {colors.lightbg2, colors.bg}
    }
}

local space = {
    Space = {
        provider = "WhiteSpace",
        highlight = {colors.bg, colors.bg}
    }
}

local git_icon = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg},
  }
}


local git_branch = {
  GitBranch = {
    provider = 'GitBranch',
    separator = " ",
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg},
  }
}

local diff_add = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '  ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.yellow,colors.bg, 'bold'},
  }
}
local diff_modified = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '  ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.yellow,colors.bg, 'bold'},
  }
}

local diff_remove = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '  ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.yellow,colors.bg, 'bold'},
  }
}

local diagnostic_error = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg1},
    separator_highlight = {colors.bg1, colors.bg1}
  }
}

local diagnostic_warn = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg1},
    separator_highlight = {colors.bg1, colors.bg1}
  }
}

local filetype_name = {
    BufferType = {
    provider = 'FileTypeName',
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg1, 'bold'},
    condition = buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.yellow,colors.bg1, 'bold'},
  }
}

local file_icon_size = {
  FileSize = {
    provider = {'FileIcon', 'FileSize'},
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg1, 'bold'},
    condition = buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.yellow,colors.bg1, 'bold'},
  }
}


local linecolum = {
  LineInfo = {
    separator = ' ',
    provider = 'LineColumn',
    separator_highlight = {colors.yellow,colors.bg, 'bold'},
    highlight = {colors.grey,colors.bg, 'bold'},
  },
}


local linepercent = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.yellow,colors.bg, 'bold'},
    highlight = {colors.bg,colors.green, 'bold'},
  }
}

-- Left Statusline

gls.left[1] = bufficon
gls.left[2] = filename
gls.left[3] = basedir
gls.left[4] = git_icon
gls.left[5] = git_branch
gls.left[6] = space

-- Right Statusline

gls.right[1] = diff_add
gls.right[2] = diff_modified
gls.right[3] = diff_remove
gls.right[4] = diagnostic_error
gls.right[5] = diagnostic_warn
gls.right[6] = filetype_name
gls.right[7] = file_icon_size
gls.right[8] = linecolum
gls.right[9] = linepercent

-- Inactive Statusline
gls.short_line_left[1] = filename
gls.short_line_left[2] = space
