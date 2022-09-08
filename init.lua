require('packer_init')

require('core/options')
require('core/keymaps')
require('core/autocmds')
require('core/tabline')
-- require('core/statusline')

require('plugins/alpha-nvim')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/nvim-tree')

require('plugins/lualine')

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- Set Background To Dark
opt.background = 'dark'

-- Set Colorscheme to NeixOne
vim.cmd([[
    colorscheme NeixOne
]])

