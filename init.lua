require('packer_init')

require('core/options')
require('core/keymaps')
require('core/autocmds')
require('core/statusline')

require('plugins/alpha-nvim')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- Set Background To Dark
opt.background = 'dark'

-- Set Colorscheme to NeixOne
vim.cmd([[
    colorscheme NeixOne
]])

-- UltiSnips Settings
vim.cmd([[
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    let g:UltiSnipsEditSplit="vertical"
]])
