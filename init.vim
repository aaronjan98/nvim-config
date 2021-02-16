" Only have the following 3 lines bellow uncommented if you want nvim to read of your .vimrc config file
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" for plugin reference:
" curl -flO $HOME/.config/nvim/autoload/plug.vim
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Comments in Vimscript start with a `"`.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
" Easy Motion
Plug 'easymotion/vim-easymotion'
" Ranger
Plug 'francoiscabrol/ranger.vim'
" Control P for fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" Syntax Highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ key binding alterations and general vim configurations ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = " "
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'aqua'
let g:gruvbox_italicize_strings = '1'
colorscheme gruvbox
set background=dark    " Setting dark mode

" Control P, configurations aren't working
" let g:ctrlp_map = '<leader>p'
" let g:ctrlp_cmd = '<leader>p'
" let g:ctrlp_working_path_mode = 'wa'

" Make Ranger replace netrw and be the file explorer
let g:ranger_map_keys = 0
map ls :RangerNewTab<CR>

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

syntax on
" set colorcolumn=90
set nowrap
set smartcase
set hlsearch
set noerrorbells

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" vim has access to the clipboard, so yanking copies to clipboard
set clipboard=unnamed

" The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set tabstop=4
" Indents will have a width of 4
set shiftwidth=4
" Sets the number of columns for a TAB
set softtabstop=4
" Expand TABs to spaces
set expandtab
set smartindent

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Re-sources your key mappings… helpful for testing out remapping of keys
nnoremap <leader>rv :source ~/.config/nvim/init.vim<CR> 
nnoremap <leader>av :tabnew ~/.config/nvim/init.vim<CR>
" easy motion
map <leader><leader>. <Plug>(easymotion-repeat)

" Add any more remappings here
inoremap ii <Esc>
cnoremap ii <Esc>
" tab remappings
nnoremap tn   :tabnew<Space>
nnoremap tk   :tabnext<CR>
nnoremap tj   :tabprev<CR>
nnoremap th   :tabfirst<CR>
nnoremap tl   :tablast<CR>

