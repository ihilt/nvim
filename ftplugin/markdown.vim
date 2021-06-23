if exists("b:did_ftplugin")
   finish
endif

let b:did_ftplugin = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal tw=100
setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal breakindentopt=shift:0
setlocal spell spelllang=en_us
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
