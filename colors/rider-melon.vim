" Vim colorscheme file
" Loads the Rider Melon Lua theme module

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
  echoerr 'Rider Melon theme requires termguicolors to be set or a GUI.'
  finish
endif

" Let the Lua module handle setting 'background' based on current value
" It requires the theme module's load function now
lua require('rider-melon.theme').load()
