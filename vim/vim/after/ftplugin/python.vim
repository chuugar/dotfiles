setlocal colorcolumn=80
" setlocal textwidth=79
setlocal foldmethod=indent
setlocal makeprg=flake8\ --ignore=E121,E123,E126,E226,E24,E704,W503,W504,E501,E302,E231,W291,E265,E305\ %
setlocal equalprg=black\ -l\ 79\ --quiet\ -\ 2>/dev/null
" setlocal isf+=32 " allow space in file name for omnicomplete with i_CTRL-X_CTRL-F
nmap <buffer> <leader><F9> :exec '!python3' shellescape(@%, 1)<CR>
