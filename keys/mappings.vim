" Re-sources your key mappings… helpful for testing out remapping of keys
nnoremap <Leader>rv :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>av :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <Leader>tt :tabnew ~/Documents/gordian/templates/<CR>
nnoremap <Leader>os :tabnew ~/Documents/dev/template/solidity/<CR>

" Easy CAPS
inoremap <c-u> <Esc>viwUea
nnoremap <Leader>u gUiw

" add line above in insert mode
inoremap OO <Esc>O

" go to end of line if typing inside operators
inoremap <c-e> <ESC>la
" skip a char in replacement mode
" inoremap <c-s> <ESC>lR

nnoremap Y y$

" TAB remappings
nnoremap \n   :tabnew<Space>
nnoremap \k   :tabnext<CR>
nnoremap \j   :tabprev<CR>
nnoremap \h   :tabfirst<CR>
nnoremap \l   :tablast<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" File Find
set path=.,,**
set wildmenu
set wildignore+=**/node_modules/**
" set hidden

" Alternate way to save
nnoremap <C-s> :w<CR>
"
" base key press for pane navigation
nnoremap <C-Q> <C-w>
"
" Use control-c instead of escape
nnoremap <C-c> <Esc>
nnoremap <C-C> <Esc><Esc>
nnoremap <Leader><Leader> <Esc>

" list buffers so that you can switch faster
nnoremap <Leader>v :buffers<CR>:b
nnoremap <Leader>3 :b#<CR>

" cnoremap :format :!format %

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" override default vim behavior of copying all changed text 
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" move text up and down like VSCode
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>k :m .-2<CR>==
" nnoremap <leader>k :m .+1<CR>==

" Keeping cursor centered when joining and searching
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Unbind some useless/annoying default key bindings.
" nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
nnoremap Q gq

" Better nav for omnicomplete
inoremap <expr> <c-u> <ESC>viwUea
" inoremap <expr> <c-u> ("\<Nop>")
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

cnoreabbrev ranger Ranger
cnoreabbrev difc DiffChangesDiffToggle

abb bc because
abb wo without
abb w\\/ with
abb tho though
abb ex example
abb ppl people
abb mm movement
abb mt mountain
abb rn right now

" go to definitions of functions, modules, constants, classes, types, etc.
"nnoremap gd :YcmCompleter GoTo<CR>
"nnoremap gd :call CocActionAsync('jumpDefinition')<CR>

" lines to save text folding:
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
" cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
" cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``
