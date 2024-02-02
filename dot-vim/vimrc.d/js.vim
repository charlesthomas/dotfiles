" uncomment
nmap <C-u> V: s/\v^(\s*)\/\/+ ?/\1/g<CR>:nohls<CR>
vmap <C-u> : s/\v^(\s*)\/\/+ ?/\1/g<CR>:nohls<CR>
" comment
nmap <C-c> V: s/\v^(\s*)/\1\/\/ /g<CR>:nohls<CR>
vmap <C-c> : s/\v^(\s*)/\1\/\/ /g<CR>:nohls<CR>

setlocal textwidth=120
setlocal colorcolumn=120
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal nospell
