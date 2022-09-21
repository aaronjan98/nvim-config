" set leader key
let g:mapleader = ' '
let s:fontsize = 12

" UltiSnippets
let g:UltiSnipsEdit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-b"
let g:UltiSnipsJumpBackwardTrigger="<c-z"

" check the current folder for tags file and keep going one directory up all the way to the root folder.
set tags+=tags;/
syntax enable                           " Enables syntax highlighing
" filetype plugin on                      " Needed for Nerd Commenter as the plugin makes use of |commentstring|

" File Find {{{

set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set hidden                              " Required to keep multiple buffers open multiple buffers

" }}}


set nowrap
set sidescrolloff=20
" set wrap linebreak                      " Format long lines by wrapping then on linebreaks 
"set breakindent                         " wrapped lines get indented
"set breakindentopt=shift:2              " three extra spaces to match its top line formatting
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
" set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
"set conceallevel=0                      " So that I can see `` in markdown files
set ignorecase                          " search case-insensitive when all characters in the string are lowercase
set smartcase                           " However, the search becomes case-sensitive if it contains any capital letters. 
set tabstop=4                           " Insert 4 spaces for a tab
set softtabstop=4
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set backspace=indent,eol,start          " makes backspace behave more reasonably, in that you can backspace over anything.
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber
" set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch                           " Enable searching as you type, rather than waiting till you press enter
set nohlsearch                          " Highlight search as you're typing
set noerrorbells visualbell t_vb=       " Disable audible bell because it's annoying.
set scrolloff=3                         " when scrolling to the top or bottom, leave some space
set cmdheight=1                         " height of command line area
set showcmd                             " Show partial command you type in the last line of the screen.
set laststatus=0
" set UltiSnipsSnippetDirectories=["Users/jan/.config/nvim/init.vim"]
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" support iterm2 256 Color Mode
set t_Co=256

" hi MsgArea guifg=#1200b3
" hi Normal=white guifg=white
" au CmdLineEnter * hi Normal ctermfg=cyan guifg=cyan
" au CmdLineLeave * hi Normal ctermfg=white guifg=white

" au CmdLineEnter * hi MsgArea guifg=#5704ab

" hi MsgArea guifg=#6d2fab
" au CmdLineEnter * hi MsgArea guifg=#6d2fab
hi MsgArea guifg=violet
au CmdLineEnter * hi MsgArea guifg=violet

" g:python3_host_prog

" You can't stop me
"cmap w!! w !sudo tee %

" Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor25,o:hor50
\,a:blinkwait50-blinkoff200-blinkon200-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

augroup tune_colors | au!
    au ColorScheme * hi Cursor guibg=#FE0001 guifg=Black
augroup END

" Automatically deletes swap file when exiting buffer if chose to recover the file
augroup AutomaticSwapRecoveryAndDelete
    autocmd!
    autocmd SwapExists * :let v:swapchoice = 'r' | let b:swapname = v:swapname 
    autocmd VimLeave * :if exists("b:swapname") | call delete(b:swapname) | unlet b:swapname | endif
augroup end


" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
" set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" change display of folds, https://stackoverflow.com/questions/33281187/how-to-change-the-way-that-vim-display-those-collapsed-folded-lines
" function! MyFoldText()
"     let nblines = v:foldend - v:foldstart + 1
"     let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
"     let line = getline(v:foldstart)
"     let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
"     let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
"     let txt = '"' . comment . expansionString . nblines
"     return txt
" endfunction
" set foldtext=MyFoldText()
