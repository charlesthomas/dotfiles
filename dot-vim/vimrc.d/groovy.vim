" uncomment
nmap <C-u> V: s/\v^(\s*)\/\/+ ?/\1/g<CR>:nohls<CR>
vmap <C-u> : s/\v^(\s*)\/\/+ ?/\1/g<CR>:nohls<CR>
" comment
nmap <C-c> V: s/\v^(\s*)/\1\/\/ /g<CR>:nohls<CR>
vmap <C-c> : s/\v^(\s*)/\1\/\/ /g<CR>:nohls<CR>

setlocal softtabstop=4
setlocal shiftwidth=4

setlocal textwidth=120
setlocal colorcolumn=120

setlocal nospell
