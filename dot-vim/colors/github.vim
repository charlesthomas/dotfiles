" VIM color file
"
" Note: Based on the GitHub theme for Sublime Text


hi clear

set background=light
if version > 580
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name="GitHub"

hi Character       guifg=#183691 guibg=None guisp=None gui=None ctermfg=24 ctermbg=None cterm=None
hi Comment         guifg=#969896 guibg=None guisp=None gui=None ctermfg=246 ctermbg=None cterm=None
hi Constant        guifg=#0086b3 guibg=None guisp=None gui=None ctermfg=31 ctermbg=None cterm=None
hi Cursor          guifg=None guibg=#333333 guisp=None gui=None ctermfg=None ctermbg=236 cterm=None
hi CursorLine      guifg=None guibg=#F8EEC7 guisp=None gui=None ctermfg=None ctermbg=230 cterm=None
hi Function        guifg=#795da3 guibg=None guisp=None gui=None ctermfg=97 ctermbg=None cterm=None
hi Keyword         guifg=#a71d5d guibg=None guisp=None gui=None ctermfg=125 ctermbg=None cterm=None
hi LineNr          guifg=None guibg=None guisp=None gui=None ctermfg=None ctermbg=None cterm=None
hi Normal          guifg=#333333 guibg=#FFFFFF guisp=None gui=None ctermfg=236 ctermbg=15 cterm=None
hi Number          guifg=#0086b3 guibg=None guisp=None gui=None ctermfg=31 ctermbg=None cterm=None
hi Operator        guifg=#A71D5D guibg=None guisp=None gui=None ctermfg=125 ctermbg=None cterm=None
hi Search          guifg=#333333 guibg=#FFE792 guisp=None gui=None ctermfg=236 ctermbg=222 cterm=None
hi StorageClass    guifg=#a71d5d guibg=None guisp=None gui=None ctermfg=125 ctermbg=None cterm=None
hi String          guifg=#183691 guibg=None guisp=None gui=None ctermfg=24 ctermbg=None cterm=None
hi Type            guifg=#0086b3 guibg=None guisp=None gui=None ctermfg=31 ctermbg=None cterm=None
hi Visual          guifg=None guibg=#B0CDE7 guisp=None gui=None ctermfg=None ctermbg=152 cterm=None

hi link Conditional Keyword
hi link Repeat Keyword

hi link cType Keyword


