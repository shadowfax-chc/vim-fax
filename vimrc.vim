scriptencoding utf-8
set encoding=utf-8

"------------------------------------------------
" Color settings
"------------------------------------------------
set background=dark

" Custom Tomorrow-Night via shadowfax-chc/vim-tomorrow-theme
silent! colorscheme Tomorrow-Night

" Basic settings
"highlight Normal                                                         guifg=Green    guibg=Black
"highlight LineNr     cterm=bold ctermfg=gray  ctermbg=NONE      gui=NONE guifg=DarkGrey guibg=NONE
"highlight Folded                ctermfg=59    ctermbg=NONE

" Pmenu for supertab etc
"highlight Pmenu      cterm=NONE ctermfg=green ctermbg=darkgray  gui=NONE guifg=green guibg=darkgray
"highlight PmenuSel   cterm=NONE ctermfg=green ctermbg=black     gui=NONE guifg=green guibg=black

" Better diff colors
"highlight DiffAdd    cterm=bold ctermfg=black ctermbg=darkgreen gui=bold guifg=black guibg=darkgreen
"highlight DiffChange cterm=bold ctermfg=black ctermbg=darkblue
"highlight DiffText   cterm=bold ctermfg=black ctermbg=lightgray
"highlight DiffDelete cterm=bold ctermfg=black ctermbg=darkred

" Underline the cursor line
"highlight CursorLine cterm=underline

" Extra white space
highlight OverLength      ctermbg=red
"highlight ColorColumn     ctermbg=darkgray
highlight ExtraWhitespace ctermbg=red guibg=red


"------------------------------------------------
" Basic settings
"------------------------------------------------
let mapleader="'"      " The leader key
set mouse=a            " Allow mouse
set nowrap             " No wrapping
set showmatch          " Show matching brackets when inserted
set splitbelow         " Default splits to below
set splitright         " Default vsplits to the right
set title              " Set title for gvim
set foldmethod=syntax  " Fold based on syntax
set foldlevel=999      " Start with folds open
set t_Co=256           " Force 256 colors
set scrolloff=999      " Keep cursor at center

" Tab settings
set expandtab          " Expand tabs into spaces
set smarttab           " Allow for easy backspace of tabs
set tabstop=4          " Use 4 spaces for tabs
set softtabstop=4      " Use 4 spaces for soft tabs
set shiftwidth=4       " Make shift same as a tab

" Indent settings
set autoindent
set nosmartindent

" Search settings
set hlsearch           " Highlight results
set incsearch          " Start showing results while typing
set ignorecase         " Ignore case in searched
set smartcase          " Use case in search with capitals

" Line number settings
set number             " Start with absolute numbers at cursor
set relativenumber     " Start with relative numbers
set numberwidth=3      " Use 3 columns for numbers

" Cursor / visual settings
set cursorline         " Show a line for the cursor
set colorcolumn=       " Unset colorcolumn
set laststatus=2       " Always show status line
set showmode           " Show the current mode

" Tab completion settings
set wildmode=list:longest     " Complete till longest common string
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.pyc         " Ignore python compiled files
set wildignore+=*.class       " Ignore java compiled files
set wildignore+=*.swp         " Ignore vim backups

" Backup/Undo settings
execute "set directory=~/.vim/swap//"
execute "set backupdir=~/.vim/backup//"
execute "set undodir=~/.vim/undo//"
set backup
set undofile
set writebackup


"------------------------------------------------
" Plugin settings
"------------------------------------------------

" Ctrl-P settings
let g:ctrlp_use_caching=0

" SuperTab settings
let g:SuperTabDefaultCompletionType = "context"

" NerdTree settings
let g:nerdtree_tabs_open_on_console_startup = 1

" Gundo settings
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_width = 25
let g:gundo_preview_height = 10

" Eclim settings
let g:EclimProjectTreeAutoOpen = 0
let g:EclimProjectTreeSharedInstance = 1
let g:EclimBrowser = 'xombrero'
let g:EclimOpenUrlInVimPatterns =
  \ [
    \ '\.\(dtd\|xml\|xsd\)$',
    \ '\.txt$',
  \ ]
command -range -nargs=* Google call eclim#web#SearchEngine('http://www.google.com/search?q=<query>', <q-args>, <line1>, <line2>)
command -nargs=? Dictionary call eclim#web#WordLookup('http://dictionary.reference.com/search?q=<query>', '<args>')

" Indent Guides
let g:indent_guides_guide_size = 1

" Air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" Use ag (the_silver_searcher) if available
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"

" YouCompleteMe
let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>d :YcmCompleter GoTo<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" terraform
let g:terraform_fmt_on_save=1

"------------------------------------------------
" Other settings
"------------------------------------------------
" Auto save and restore views for these files
autocmd BufWinLeave *.sh mkview
autocmd BufWinEnter *.sh silent loadview
autocmd BufWinLeave *.h mkview
autocmd BufWinEnter *.h silent loadview
autocmd BufWinLeave *.h mkview
autocmd BufWinEnter *.h silent loadview
autocmd BufWinLeave *.js mkview
autocmd BufWinEnter *.js silent loadview
autocmd BufWinLeave *.coffee mkview
autocmd BufWinEnter *.coffee silent loadview
autocmd BufWinLeave *.sls mkview
autocmd BufWinEnter *.sls silent loadview

" Treat all html as htmldjango
autocmd BufNewFile,BufRead *.html set filetype=htmldjango

" Treat all *.md as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Treat .quicktask as quicktask
autocmd BufNewFile,BufRead *.quicktask setf quicktask

" Show extra which space and over 80
match OverLength /\%80v.\+/
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Fun with numbers
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" Short cuts for split nav
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Easier visual indent
vnoremap < <gv
vnoremap > >gv

" Command to write as root if forgot to open with sudo
cmap w!! %!sudo tee > /dev/null %


" Cleanup white space
function! RemoveTrailingWhiteSpace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        :%s/\s\+$//e
        normal yz<CR>
        normal `z
    endif
endfunction

" Key bindings
noremap <silent><leader>/ :nohlsearch<Bar>:echo<CR>
nnoremap <F2> :call NumberToggle()<cr>
map <F3> :set wrap! wrap?<CR>
map <F4> :set hlsearch! hlsearch?<CR>
map <F5> :edit <CR>
map <F6> :edit! <CR>
nmap <F12> :NERDTreeTabsToggle <CR>
nmap <F7> :GundoToggle <CR>
map <F8> :TagbarToggle <CR>
map <F9> :set paste! paste?<CR>
map <F10> :set cursorline! cursorline?<CR>
map <F11> :set spell! spell?<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

nmap <leader>a :Ack! <cword><CR>
noremap <leader>f :NERDTreeFind<CR>
noremap <leader>n :lnext<CR>
noremap <leader>p :lprevious<CR>
noremap <leader>s :call RemoveTrailingWhiteSpace()<CR>
