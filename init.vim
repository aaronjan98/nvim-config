" Only have the following 3 lines bellow uncommented if you want nvim to read of your .vimrc config file
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" curl -flO $HOME/.config/nvim/autoload/plug.vim
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible              " be iMproved, required
filetype off                  " required

inoremap ii <Esc>
cnoremap ii <Esc>

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox
