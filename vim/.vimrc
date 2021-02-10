"
"     ██╗   ██╗██╗███╗   ███╗██████╗  █████╗
"     ██║   ██║██║████╗ ████║██╔══██╗██╔══██╗
"     ╚██╗ ██╔╝██║██╔████╔██║██████╔╝██║  ╚═╝
"      ╚████╔╝ ██║██║╚██╔╝██║██╔══██╗██║  ██╗
"  ██╗  ╚██╔╝  ██║██║ ╚═╝ ██║██║  ██║╚█████╔╝
"  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚════╝
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Don't try to be vi compatible
set encoding=UTF-8              " Encoding
set mouse=a                     " Allow mouse click to move cursor
"set ttymouse=                   " Set this to the name of the terminal that supports mouse codes.
set ttyfast                     " Terminal acceleration
set visualbell                  " Blink cursor on error instead of beeping
set number                      " Show line number
set relativenumber              " Lines numbered relative to the cursor's position
set numberwidth=5               " Width of line number
set expandtab                   " Expand tabs to spaces
set tabstop=4                   " Spaces to be inserted when tab key is pressed
set shiftwidth=4                " Spaces to be inserted for indentation
set softtabstop=4               " Makes the spaces feel like real tabs
set smartindent                 " Automatically inserts one extra level of indentation in some cases
set autoindent                  " Applies the indentation of the current line to the next
set smarttab                    " <TAB> key inserts indentation according to 'shiftwidth' at the beginning of the line
set showmatch                   " Show matching parenthesis highlighted
set noshowmode                  " Show the current mode (showmode/noshowmode)
set backspace=indent,eol,start  " Make backspace work like most other programs
set wrap                        " Wrap words visually
set linebreak                   " Make sure that Vim does not break in the middle of a word when wrapping
set textwidth=0                 " Use the full width of the window
set wrapmargin=0                " Specifies the number of characters from the right window border where wrapping begins
set formatoptions-=cro          " Disable continuation of comment at linebreaks
set history=1000                " Command history
set filetype=dosini             " Highlighting for INI files
set showcmd                     " Shows partial commands in the last line of the screen
set scrolloff=10                " Scroll offset at top and bottom of screen
set cmdheight=2                 " Better display for messages
set signcolumn=yes              " Show sign column on the far left (for debugging purposes)
set updatetime=500              " Default 4000
set nobackup                    " No backup is made
set nowritebackup               " No backup is made
set splitright                  " When split horizontally, the right one should be active
set splitbelow                  " When split vertically, the lower one should be active
set modelines=0                 " For security reasons, invalid use of modelines in files
set secure                      " Prohibit .vimrc files to execute shell, create files, etc...
"set title                       " Display the title of the file in statusline
"set ruler                       " Display navigation numbers in statusline
set laststatus=2                " Always show statusline (2 = always)
set showtabline=2               " Always show tabline, even if there's just one tab

let mapleader=" "               " Use space as <leader> key

" Enables a menu at the bottom of the screen when pressing <TAB> on a command
set wildmenu
set wildmode=longest:list,full

" Show hidden characters
noremap <silent><leader>sl :set list!<CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" For Windows
"let g:gitgutter_git_executable = 'C:\Program Files (x86)\Git\bin\git.exe'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                    " Required for vundle
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " Required

" -- Add plugins below --
Plugin 'morhetz/gruvbox'                    " Colorscheme
Plugin 'vim-airline/vim-airline'            " Sexy statusline
Plugin 'vim-airline/vim-airline-themes'     " Sexy statusline themes
Plugin 'airblade/vim-gitgutter'             " Git diff in the sign column
" https://github.com/airblade/vim-gitgutter for git diffs in signcolumn
" nerdtree for file explorer
" https://github.com/neoclide/coc.nvim make vim smart as VSCode

call vundle#end()
filetype plugin indent on       " Enable
filetype plugin on              " Enable again
filetype on                     " Enable yet again


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                               " Turn on syntax highlighting
set t_Co=256                            " Set 256 colors
set guifont=Roboto_Mono_SemiBold:h9     " https://fonts.google.com/specimen/Roboto+Mono
colorscheme gruvbox                     " Use gruvbox as colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
set background=dark                     " Set the background color
set termguicolors                       " Uses your colorscheme and init

" Add highlight at unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Colors for Menu items, normal and selected items
highlight Pmenu guibg=#b8bb26 ctermbg=100
highlight PmenuSel guibg=#3a3a3a ctermbg=237

" Settings for sexy statusline (airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='wombat'
"let g:airline_section_a = airline#section#create(['branch'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CURSOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline          " Highlights current line
augroup CursorLine      " Only show CursorLine in current window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase          " Ignore case sensitive in searches
set smartcase           " Use case sensitive if any caps used
set hlsearch            " Highlight all search matches
set incsearch           " Incremental Search command to highlight the searching string while typing Be

" <esc> to clear highlighted search matches, <silent> to not display command
nnoremap <silent><ESC> :noh<RETURN><ESC>
nnoremap <silent><ESC>^[ <ESC>^[

" Set Search background and foreground color
highlight Search ctermbg=Yellow ctermfg=Black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUTS/REMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank/Paste to/from register/clipboard
vnoremap <silent><leader>y "+y<CR>:echo "Yanked"<CR>
nnoremap <silent><leader>p "+p

" Reload config
nnoremap <silent><leader>rc :source ~/.vimrc<CR>:echo "Config reloaded"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CODE SNIPPET COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType cpp inoremap ;co std::cout<Space><<<Space>f<Space><<<Space> std::endl;<Esc>Ffcw


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUIDES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ### PLUGINS ###
" git clone https://github.com/VundleVim/Vundle.vim.git $HOME/vimfiles/bundle/Vundle.vim
" Run :PluginInstall or vim +PluginInstall +qall
"
"
" ### Good to know ###
" :retab - To convert all tabs to spaces in a file
" Use '\C' for case sensitive in searches
"
