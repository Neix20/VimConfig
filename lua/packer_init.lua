
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Vim Surround Statement with Brackets
    use 'tpope/vim-surround'

    -- Icons
    -- use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    -- Auto Pairs
    use 'jiangmiao/auto-pairs'

    -- Themes
    use 'rakr/vim-one'
    use 'NLKNguyen/papercolor-theme'

    use 'morhetz/gruvbox'

    -- Test Startup Time
    use 'dstein64/vim-startuptime'

    -- Git
    use 'tpope/vim-fugitive'

    -- Note Editor
    use 'vimwiki/vimwiki'

    -- Auto Format
    use 'vim-autoformat/vim-autoformat'

    -- Tags
    use 'preservim/tagbar'

    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    -- Tabulate
    use 'godlygeek/tabular'

    -- fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Lua Plugins

    -- Dashboard (start screen)
    use 'goolord/alpha-nvim'
    -- use 'mhinz/vim-startify'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    -- use 'scrooloose/nerdtree'

    -- Statusline
    -- use 'feline-nvim/feline.nvim'
    -- use 'rbong/vim-crystalline'
    use 'nvim-lualine/lualine.nvim'

    -- TabLine
    use {
        'kdheepak/tabline.nvim',
        config = function()
            require'tabline'.setup {
                -- Defaults configuration options
                enable = true,
                options = {
                -- If lualine is installed tabline will use separators configured in lualine by default.
                -- These options can be used to override those settings.
                    section_separators = {'', ''},
                    component_separators = {'', ''},
                    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
                    show_devicons = true, -- this shows devicons in buffer section
                    show_bufnr = false, -- this appends [bufnr] to buffer section,
                    show_filename_only = false, -- shows base filename only instead of relative path in filename
                    modified_icon = "+ ", -- change the default modified icon
                    modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
                    show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
                }
            }
            vim.cmd[[
              set guioptions-=e " Use showtabline in gui vim
              set sessionoptions+=tabpages,globals " store tabpages and globals in session
            ]]
        end
    }

    -- Treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
