call plug#begin()

    " File Explorer
    Plug 'https://github.com/scrooloose/nerdtree'
    
    " Vim Info
    Plug 'https://github.com/rbong/vim-crystalline'
    
    " Vim Surround Statement with Brackets
    Plug 'https://github.com/tpope/vim-surround'
    
    " Homepage
    Plug 'https://github.com/mhinz/vim-startify'

    " Icons
    Plug 'ryanoasis/vim-devicons'

    " Auto Pairs
    Plug 'https://github.com/jiangmiao/auto-pairs'
    
    " Themes
    Plug 'https://github.com/rakr/vim-one'
    Plug 'NLKNguyen/papercolor-theme'

    Plug 'https://github.com/morhetz/gruvbox'

    " Syntax Highlighting
    Plug 'jelera/vim-javascript-syntax' " Javascript Syntax

    " Test Startup Time
    Plug 'https://github.com/dstein64/vim-startuptime'

    " Git 
    Plug 'https://github.com/tpope/vim-fugitive'

    " Note Editor
    Plug 'vimwiki/vimwiki'

    " Auto Format
    Plug 'vim-autoformat/vim-autoformat'
    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

let s:cyan = '#56b6c2'
let s:blue = '#61afef'
let s:dark_blue = '#3e4452'
let s:purple = '#c678dd'
let s:green = '#98c379'
let s:red = '#e06c75'
let s:dark_red = '#be5046'
let s:orange = '#d19a66'
let s:dark_orange = '#e5c07b'
let s:black = '#282c34'
let s:pure_black = "#000000"
let s:white = '#abb2bf'
let s:pure_white = '#ffffff'

" Custom Theme
function! NeixOne_lightTheme() abort
    call crystalline#generate_theme({
        \ 'NormalMode':  [[235, 114], [s:pure_black, s:green]],
        \ 'InsertMode':  [[235, 39],  [s:pure_black, s:blue]],
        \ 'VisualMode':  [[235, 170], [s:pure_black, s:purple]],
        \ 'ReplaceMode': [[235, 204], [s:pure_black, s:blue]],
        \ '':            [[145, 236], [s:pure_white, s:dark_blue]],
        \ 'Inactive':    [[235, 145], [s:pure_black, s:white]],
        \ 'Fill':        [[114, 236], [s:pure_white, s:pure_black]],
        \ 'Tab':         [[145, 236], [s:pure_white, s:black]],
        \ 'TabType':     [[235, 170], [s:pure_black, s:purple]],
        \ 'TabSel':      [[235, 114], [s:pure_black, s:green]],
        \ 'TabFill':     [[114, 236], [s:pure_white, s:dark_blue]],
        \ })
endfunction

function! NeixOne_darkTheme() abort
    call crystalline#generate_theme({
        \ 'NormalMode':  [[235, 114], [s:pure_black, s:green]],
        \ 'InsertMode':  [[235, 39],  [s:pure_black, s:blue]],
        \ 'VisualMode':  [[235, 170], [s:pure_black, s:purple]],
        \ 'ReplaceMode': [[235, 204], [s:pure_black, s:blue]],
        \ '':            [[145, 236], [s:pure_white, s:dark_blue]],
        \ 'Inactive':    [[235, 145], [s:pure_black, s:white]],
        \ 'Fill':        [[114, 236], [s:pure_black, s:pure_white]],
        \ 'Tab':         [[145, 236], [s:white, s:black]],
        \ 'TabType':     [[235, 170], [s:pure_black, s:purple]],
        \ 'TabSel':      [[235, 114], [s:pure_black, s:green]],
        \ 'TabFill':     [[114, 236], [s:pure_white, s:dark_blue]],
        \ })
endfunction

augroup CrystalLineColorScheme
  autocmd!
  autocmd ColorScheme * call CrystalLineUpdate()
augroup END

function! CrystalLineUpdate()
  try
    if g:colors_name =~# 'one\|PaperColor\|gruvbox'
        let l:color = get({
            \'one': 'onedark',
            \'PaperColor': 'papercolor',
            \'gruvbox': 'gruvbox',
            \}, g:colors_name, 'gruvbox')
        call crystalline#set_theme(l:color)
    elseif g:colors_name ==# 'NeixOne'
        if &background ==# 'dark'
            call NeixOne_darkTheme()
        else
            echo "Hello World"
            call NeixOne_lightTheme()
        endif
    endif
  catch
  endtry
endfunction

function! GitBranchName()
    let l:git_branch = system("git branch")

    " Check if Git Branch Exists
    if stridx(l:git_branch, "Fatal") >= 0
        return ''
    endif

    " Remove First 2 Characters
    let l:git_branch = l:git_branch[2:-2]

    return l:git_branch
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
            let l:s .= '%#CrystallineTabFill#'
            let l:s .= ' %t%h%w%m%r %{&paste ?"PASTE ":""}%{&spell?"SPELL ":"" } '
            let l:s .= '%='

            " Tail
            let l:s .= '%#CrystallineNormalMode#' . ' %l:%c '
        endif
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

set tabline=%!MyTabLine()

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set termguicolors
set foldmethod=indent

set tags=./tags,tags

set encoding=utf-8
set hidden
set laststatus=2
set showmatch               " show matching 
set ignorecase              " case insensitive 

set hlsearch                " highlight search 
set incsearch               " incremental search

set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed

set number                  " add line numbers

set wildmode=longest,list   " get bash-like tab completions

set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting

" set autoread
" au CursorHold * checktime  

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set t_Co=256

set background=dark
colorscheme NeixOne

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'onedark'

" Startify Startup Screen
let g:startify_custom_header = [
            \'          _____                    _____                    _____                    _____            _____  ',
            \'         /\    \                  /\    \                  /\    \                  /\    \          /\    \ ',
            \'        /::\    \                /::\____\                /::\    \                /::\____\        /::\____\',
            \'       /::::\    \              /:::/    /               /::::\    \              /:::/    /       /:::/    /',
            \'      /::::::\    \            /:::/    /               /::::::\    \            /:::/    /       /:::/    / ',
            \'     /:::/\:::\    \          /:::/    /               /:::/\:::\    \          /:::/    /       /:::/    /  ',
            \'    /:::/__\:::\    \        /:::/____/               /:::/__\:::\    \        /:::/    /       /:::/    /   ',
            \'    \:::\   \:::\    \      /::::\    \              /::::\   \:::\    \      /:::/    /       /:::/    /    ',
            \'  ___\:::\   \:::\    \    /::::::\    \   _____    /::::::\   \:::\    \    /:::/    /       /:::/    /     ',
            \' /\   \:::\   \:::\    \  /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \  /:::/    /       /:::/    /      ',
            \'/::\   \:::\   \:::\____\/:::/  \:::\    /::\____\/:::/__\:::\   \:::\____\/:::/____/       /:::/____/       ',
            \'\:::\   \:::\   \::/    /\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /\:::\    \       \:::\    \       ',
            \' \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/  \:::\    \       \:::\    \      ',
            \'  \:::\   \:::\    \               \::::::/    /    \:::\   \:::\    \       \:::\    \       \:::\    \     ',
            \'   \:::\   \:::\____\               \::::/    /      \:::\   \:::\____\       \:::\    \       \:::\    \    ',
            \'    \:::\  /:::/    /               /:::/    /        \:::\   \::/    /        \:::\    \       \:::\    \   ',
            \'     \:::\/:::/    /               /:::/    /          \:::\   \/____/          \:::\    \       \:::\    \  ',
            \'      \::::::/    /               /:::/    /            \:::\    \               \:::\    \       \:::\    \ ',
            \'       \::::/    /               /:::/    /              \:::\____\               \:::\____\       \:::\____\',
            \'        \::/    /                \::/    /                \::/    /                \::/    /        \::/    /',
            \'         \/____/                  \/____/                  \/____/                  \/____/          \/____/ ',
            \'                                                                                                             ',
            \]
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-n> :NERDTree<CR>

" Copy Clipboard
vnoremap <C-c> "+y

" Replace Undo
nnoremap <C-z> u
inoremap <C-z> u
vnoremap <C-z> u

