vim.cmd [[
  try
    colorscheme moonlight 
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme slate
    set background=dark
  endtry
]]

vim.g.moonlight_disable_background = true -- TODO: option not working
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
