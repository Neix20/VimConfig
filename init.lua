require('packer_init')

require('core/options')
require('core/keymaps')
require('core/autocmds')

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

vim.cmd([[
    augroup CrystalLineColorScheme
        autocmd!
        autocmd ColorScheme * call CrystalLineUpdate()
    augroup END

    function! CrystalLineUpdate()
        try
            if g:colors_name =~# 'one\|PaperColor\|gruvbox\|NeixOne'
                let l:color = get({
                    \'one': 'onedark',
                    \'PaperColor': 'papercolor',
                    \'gruvbox': 'gruvbox',
                    \'NeixOne': 'neixone',
                    \}, g:colors_name, 'gruvbox')
                call crystalline#set_theme(l:color)
            endif
        catch
        endtry
    endfunction

    function EnableLiveChanges()
        set autoread
        au CursorHold * checktime
    endfunction

    function! StatusLine(current, width)
        let l:s = ''

        " Body
        let l:s .= '%#CrystallineTabFill#'
        let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '

        let l:s .= '%='
        let l:s .= '%#CrystallineNormalMode#'
        let l:s .= ' %l:%c '

        if a:current
            if a:width > 100
                " Head
                let l:s = crystalline#mode()

                " Second Head
                let l:s .= crystalline#right_mode_sep('') . '  %{fugitive#Head()} '

                " Body
                let l:s .= crystalline#right_sep('', 'Fill')
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
                let l:s .= '%='
                let l:s .= ' %{&fileencoding?&fileencoding:&encoding} |'
                let l:s .= ' %{WebDevIconsGetFileFormatSymbol()} |'
                let l:s .= ' %{&ft} %{WebDevIconsGetFileTypeSymbol()} '

                " Second Tail
                let l:s .= crystalline#left_sep('', 'Fill') . ' %P '

                " Tail
                let l:s .= crystalline#left_mode_sep('') . ' %l:%c '
            elseif a:width > 60 && a:width <= 100
                " Head
                let l:s = crystalline#mode()

                " Second Head
                let l:s .= crystalline#right_mode_sep('')

                " Body
                let l:s .= crystalline#right_sep('', 'Fill')
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
                let l:s .= '%='
                let l:s .= ' %{&ft} %{WebDevIconsGetFileTypeSymbol()} '

                " Second Tail
                let l:s .= crystalline#left_sep('', 'Fill') . ' %P '

                " Tail
                let l:s .= crystalline#left_mode_sep('') . ' %l:%c '
            elseif a:width > 40 && a:width <= 60
                " Head
                let l:s = crystalline#mode()

                " Second Head
                let l:s .= crystalline#right_mode_sep('')

                " Body
                let l:s .= crystalline#right_sep('', 'Fill')
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":"" } '
                let l:s .= '%='

                " Second Tail
                let l:s .= crystalline#left_sep('', 'Fill')

                " Tail
                let l:s .= crystalline#left_mode_sep('') . ' %l:%c '
            endif
        else
            if a:width > 100
                " Head
                let l:s = ''

                " Second Head
                let l:s .= '%#CrystallineTabFill#'
                let l:s .= '  %{fugitive#Head()} '

                " Body
                let l:s .= '%#CrystallineFill#'
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
                let l:s .= '%='
                let l:s .= ' %{&fileencoding?&fileencoding:&encoding} |'
                let l:s .= ' %{WebDevIconsGetFileFormatSymbol()} |'
                let l:s .= ' %{&ft} %{WebDevIconsGetFileTypeSymbol()} '

                " Second Tail
                let l:s .= '%#CrystallineTabFill#' . ' %P '

                " Tail
                let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
            elseif a:width > 60 && a:width <= 100
                " Head
                let l:s = ''

                " Second Head
                let l:s .= '%#CrystallineTabFill#'

                " Body
                let l:s .= '%#CrystallineFill#'
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
                let l:s .= '%='
                let l:s .= ' %{&ft} %{WebDevIconsGetFileTypeSymbol()} '

                " Second Tail
                let l:s .= '%#CrystallineTabFill#' . ' %P '

                " Tail
                let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
            elseif a:width > 40 && a:width <= 60
                " Head
                let l:s = ''

                " Body
                let l:s .= '%#CrystallineFill#'
                let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":"" } '
                let l:s .= '%='

                " Tail
                let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
            endif
        endif

        return l:s
    endfunction

    function! StatusLineWithoutDev(current, width)
        let l:s = ''

        " Body
        let l:s .= '%#CrystallineTabFill#'
        let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '

        let l:s .= '%='
        let l:s .= '%#CrystallineNormalMode#'
        let l:s .= ' %l:%c '

        if a:width > 100
            " Head
            let l:s = ''

            " Second Head
            let l:s .= '%#CrystallineTabFill#'
            let l:s .= ' %{fugitive#Head()} '

            " Body
            let l:s .= '%#CrystallineFill#'
            let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
            let l:s .= '%='
            let l:s .= ' %{&fileencoding?&fileencoding:&encoding} |'
            let l:s .= ' %{&ft} '

            " Second Tail
            let l:s .= '%#CrystallineTabFill#' . ' %P '

            " Tail
            let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
        elseif a:width > 60 && a:width <= 100
            " Head
            let l:s = ''

            " Second Head
            let l:s .= '%#CrystallineTabFill#'

            " Body
            let l:s .= '%#CrystallineFill#'
            let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
            let l:s .= '%='
            let l:s .= ' %{&ft} '

            " Second Tail
            let l:s .= '%#CrystallineTabFill#' . ' %P '

            " Tail
            let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
        elseif a:width > 40 && a:width <= 60
            " Head
            let l:s = ''

            " Body
            let l:s .= '%#CrystallineFill#'
            let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":"" } '
            let l:s .= '%='

            " Tail
            let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
        endif

        return l:s
    endfunction

    " Tab Line
    function MyTabLabel(n)
        let buflist = tabpagebuflist(a:n)
        let winnr = tabpagewinnr(a:n)
        let fileName = bufname(buflist[winnr - 1])

        " Only Get Tail of Path
        let fileName = fnamemodify(fileName, ":t")

        " Check if Filename is Empty
        let fileName = strlen(fileName) > 0 ? fileName : '[No Name]'

        return fileName
    endfunction

    function MyTabLine()
        let s = ''
        for i in range(tabpagenr('$'))
            " select the highlighting
            if i + 1 == tabpagenr()
                let s .= '%#CrystallineTabSel#'
            else
                let s .= '%#CrystallineTab#'
            endif

            " set the tab page number (for mouse clicks)
            " let s .= ' ' . (i + 1)

            " the label is made by MyTabLabel()
            let l:tabLabel = MyTabLabel(i + 1)
            let l:modified = gettabwinvar(i + 1, 1, '&modified')
            let s .= ' ' .  WebDevIconsGetFileTypeSymbol(l:tabLabel) . ' ' . l:tabLabel . ' ' . ( l:modified == 1 ? '[+] ' : '') . ' '
        endfor

        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#CrystallineTabFill#%T'

        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
            let s .= '%=%#CrystallineTab#%999XX'
        endif

        return s
    endfunction

    function MyTabLineWithoutDev()
        let s = ''
        for i in range(tabpagenr('$'))
            " select the highlighting
            if i + 1 == tabpagenr()
                let s .= '%#CrystallineTabSel#'
            else
                let s .= '%#CrystallineTab#'
            endif

            " set the tab page number (for mouse clicks)
            " let s .= ' ' . (i + 1)

            " the label is made by MyTabLabel()
            let l:tabLabel = MyTabLabel(i + 1)
            let l:modified = gettabwinvar(i + 1, 1, '&modified')
            let s .= ' ' . l:tabLabel . ' ' . ( l:modified == 1 ? '[+] ' : '') . ' '
        endfor

        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#CrystallineTabFill#%T'

        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
            let s .= '%=%#CrystallineTab#%999XX'
        endif

        return s
    endfunction

    function SetStatuslineNormal()
        let g:crystalline_statusline_fn = 'StatusLine'
        call crystalline#set_statusline(g:crystalline_statusline_fn)
        set tabline=%!MyTabLine()
    endfunction

    function SetStatuslineWithoutDev()
        let g:crystalline_statusline_fn = 'StatusLineWithoutDev'
        call crystalline#set_statusline(g:crystalline_statusline_fn)
        set tabline=%!MyTabLineWithoutDev()
    endfunction
]])

-- Crystalline Settings
vim.cmd([[
    let g:crystalline_enable_sep = 1
    let g:crystalline_statusline_fn = 'StatusLineWithoutDev'
    let g:crystalline_theme = 'neixone'
]])

-- TabLine Settings
vim.cmd([[
    set tabline=%!MyTabLineWithoutDev()
]])

-- UltiSnips Settings
vim.cmd([[
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    let g:UltiSnipsEditSplit="vertical"
]])
