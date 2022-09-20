
" a boolean value will force neovide to redraw all the time. This can be a quick hack if animations appear to stop too early.
let g:neovide_no_idle=v:true
" a boolean value will set whether the app should take up the entire screen. This uses the so called 'windowed fullscreen' mode that is sometimes used in games which want quick window switching.
" let g:neovide_fullscreen=v:true
" determines the time it takes for the cursor to complete it's animation in seconds.
let g:neovide_cursor_animation_length=0.13
" determines how much the trail of the cursor lags behind the front edge.
let g:neovide_cursor_trail_length=0.8
" Enables or disables antialiasing of the cursor quad. Disabling may fix some cursor visual issues.
" let g:neovide_cursor_antialiasing=v:true

" cursor particles
let g:neovide_cursor_vfx_mode = "railgun"
" Sets the transparency of the generated particles.
let g:neovide_cursor_vfx_opacity=200.0
" Sets the amount of time the generated particles should survive.
let g:neovide_cursor_vfx_particle_lifetime=4
" Sets the number of generated particles.
" let g:neovide_cursor_vfx_particle_density=7.0
" Sets the speed of particle movement.
let g:neovide_cursor_vfx_particle_speed=10.0


highlight Normal guifg=#dfdfdf ctermfg=15 guibg=black

set mouse=nicr
set mouse=a
set guifont=calibri:h15
