" VIM color file
"
" Note: Based on the GitHub theme for Sublime Text
" Light and dark variants follow 'background' (don't set it here, so Vim can
" detect it from the terminal).

hi clear
if exists("syntax_on")
	syntax reset
endif

set t_Co=256
let g:colors_name="github"

if &background ==# "dark"
	" Pure black background (16 is fixed #000000, not remapped by terminal themes)
	hi Normal          guifg=#E6EDF3 guibg=#000000 guisp=NONE gui=NONE ctermfg=255 ctermbg=16 cterm=NONE
	hi Character       guifg=#A5D6FF guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
	hi Comment         guifg=#8B949E guibg=NONE guisp=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
	hi Constant        guifg=#79C0FF guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
	hi Cursor          guifg=#000000 guibg=#E6EDF3 guisp=NONE gui=NONE ctermfg=16 ctermbg=255 cterm=NONE
	hi CursorLine      guifg=NONE guibg=#161B22 guisp=NONE gui=NONE ctermfg=NONE ctermbg=233 cterm=NONE
	hi Function        guifg=#D2A8FF guibg=NONE guisp=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
	hi Keyword         guifg=#FF7B72 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
	hi Number          guifg=#79C0FF guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
	hi Operator        guifg=#FF7B72 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
	hi Search          guifg=#000000 guibg=#D29922 guisp=NONE gui=NONE ctermfg=16 ctermbg=178 cterm=NONE
	hi StorageClass    guifg=#FF7B72 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
	hi String          guifg=#A5D6FF guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
	hi Type            guifg=#79C0FF guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
	hi Visual          guifg=NONE guibg=#264F78 guisp=NONE gui=NONE ctermfg=NONE ctermbg=24 cterm=NONE
else
	" Pure white background (231 is fixed #ffffff; 15 is the terminal's "bright white", often grey)
	hi Normal          guifg=#333333 guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=236 ctermbg=231 cterm=NONE
	hi Character       guifg=#183691 guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
	hi Comment         guifg=#969896 guibg=NONE guisp=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
	hi Constant        guifg=#0086b3 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
	hi Cursor          guifg=NONE guibg=#333333 guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
	hi CursorLine      guifg=NONE guibg=#F8EEC7 guisp=NONE gui=NONE ctermfg=NONE ctermbg=230 cterm=NONE
	hi Function        guifg=#795da3 guibg=NONE guisp=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
	hi Keyword         guifg=#a71d5d guibg=NONE guisp=NONE gui=NONE ctermfg=125 ctermbg=NONE cterm=NONE
	hi Number          guifg=#0086b3 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
	hi Operator        guifg=#A71D5D guibg=NONE guisp=NONE gui=NONE ctermfg=125 ctermbg=NONE cterm=NONE
	hi Search          guifg=#333333 guibg=#FFE792 guisp=NONE gui=NONE ctermfg=236 ctermbg=222 cterm=NONE
	hi StorageClass    guifg=#a71d5d guibg=NONE guisp=NONE gui=NONE ctermfg=125 ctermbg=NONE cterm=NONE
	hi String          guifg=#183691 guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
	hi Type            guifg=#0086b3 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
	hi Visual          guifg=NONE guibg=#B0CDE7 guisp=NONE gui=NONE ctermfg=NONE ctermbg=152 cterm=NONE
endif

hi LineNr          guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

hi link Conditional Keyword
hi link Repeat Keyword

hi link cType Keyword
