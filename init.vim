call plug#begin()

    " File Explorer
    Plug 'https://github.com/scrooloose/nerdtree'
    
    " Vim Info
    Plug 'https://github.com/rbong/vim-crystalline'
    
    " Vim Comments
    Plug 'https://github.com/tpope/vim-commentary'
    
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
    Plug 'shinchu/lightline-gruvbox.vim'

    " Syntax Highlighting
    Plug 'davidhalter/jedi-vim' " Python Syntax 
    Plug 'jelera/vim-javascript-syntax' " Javascript Syntax

    " Git 
    Plug 'https://github.com/tpope/vim-fugitive'

    " Note Editor
    Plug 'vimwiki/vimwiki'

    " IntelliSense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Auto Format
    Plug 'vim-autoformat/vim-autoformat'
    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

au FileType html let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})
au FileType cshtml let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})

augroup CrystalLineColorScheme
  autocmd!
  autocmd ColorScheme * call CrystalLineUpdate()
augroup END

function! CrystalLineUpdate()
    try
    if g:colors_name =~# 'one\|PaperColor\|gruvbox'
        let l:color = get({'one': 'onedark', 'PaperColor': 'papercolor', 'gruvbox': 'gruvbox'}, g:colors_name, 'gruvbox')
        let g:crystalline_theme = l:color
        call crystalline#apply_current_theme()
    endif
  catch
  endtry
endfunction

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif

  let l:s .= ' %f%h%w%m%r '

  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#Head()} %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
  endif

  if a:width > 40 
    let l:s .= '%='
    if a:current
      let l:s .= crystalline#left_sep('', 'Fill') . ' %{&ff} | %{&fenc!=#""?&fenc:&enc} | %{&ft} '
    endif
  else 
    let l:s .= ' '
  endif

  if a:width > 80
    let l:s .= crystalline#left_mode_sep('') . ' %P %l:%c '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'gruvbox'

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set termguicolors
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

set autoread
au CursorHold * checktime  

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
colorscheme gruvbox

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

