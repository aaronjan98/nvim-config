call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-fugitive'                              " git control w/o leaving vim
    Plug 'justinmk/vim-sneak'                              " ^^
" let g:comfortable_motion_scroll_up_key = 'k'
    " Plug 'svermeulen/vim-extended-ft'                      " make F, f, T, t keys case insensitive
    Plug 'francoiscabrol/ranger.vim'                       " file search
    Plug 'rbgrouleff/bclose.vim'                           " vim opens ranger when opening a dir
    Plug 'ctrlpvim/ctrlp.vim'                              " fuzzy search
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}    " multi-cursor editing
    " Plug 'codota/tabnine-vim'                              " Intellisense
    Plug 'jiangmiao/auto-pairs'                            " Auto complete closing brackets
    Plug 'tpope/vim-commentary'                            " deals with comments
    Plug 'norcalli/nvim-colorizer.lua'                     " shows CSS colors by highlighting hex and rgb values that color
    Plug 'joshdick/onedark.vim'                            " theme
    Plug 'fcpg/vim-orbital'                                " theme
    Plug 'drewtempelmeyer/palenight.vim'                   " theme
    " post install (yarn install | npm install) then load plugin only for editing supported files
    "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    Plug 'w0rp/ale' " async linting

    Plug 'yuttie/comfortable-motion.vim'
    Plug 'tpope/vim-surround'

    Plug 'wakatime/vim-wakatime'                           " measure time spent working

    Plug 'christoomey/vim-tmux-navigator'  "This allows us to use ctrl-<direction> to move anywhere in our tmux window, whether we’re jumping between vim splits or tmux panes.

    Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    Plug 'github/copilot.vim'
    Plug 'tomlion/vim-solidity'
    Plug 'sirver/ultisnips'
call plug#end()

" Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1

" consider following plugins:
" ReplaceWithRegister
" Titlecase
" Sort-motion
" System-copy

" look into custom text objects

" source $HOME/.config/nvim/plugged/diffchanges/plugin/diffchanges.vim


" Smooth scrolling options from comforable-motion
nnoremap <silent> <C-d> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-200)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(250)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-250)<CR>
" partial scroll
nnoremap <silent> <leader>k :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <leader>j :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <leader>y :call comfortable_motion#flick(-50)<CR>
nnoremap <silent> <leader>e :call comfortable_motion#flick(50)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 6.0

let g:ale_linters = {'python': ['flake8'] }
let g:ale_fixers = {'*': [], 'python': ['black', 'isort', 'remove_trailing_lines', 'trim_whitespace', 'autopep8']}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <Leader>s <Plug>(ale_next_wrap)
nmap <silent> <Leader>x <Plug>(ale_previous_wrap)

" sneak
"~/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/sneak.vim

" Make Ranger replace netrw and be the file explorer
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
map <leader>f :RangerNewTab<CR>
map <leader>rr :Ranger<CR>

" Plugin configuration for colorizer
if (has("termguicolors"))
	set termguicolors
endif
lua require 'colorizer'.setup()

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
    source $HOME/.config/nvim/paths.vim
endif
