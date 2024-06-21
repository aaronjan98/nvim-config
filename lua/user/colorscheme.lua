vim.cmd([[
  try
    colorscheme moonlight
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme habamax
    set background=dark
  endtry
]])

-- darker bg color: quiet, murphy, industry
-- lighter: habamax, desert, slate

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi StatusLine guibg=NONE ctermbg=NONE]])

-- highlight color
vim.cmd([[ hi Visual guifg=Yellow guibg=#13040f gui=none ]])
