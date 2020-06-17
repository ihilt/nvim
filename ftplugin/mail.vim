if exists("b:did_ftplugin")
   finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl modeline< tw< fo< comments< colorcolumn< wrap< linebreak< breakindentopt< number<"

setlocal nomodeline
setlocal tw=72
setlocal colorcolumn=72
setlocal fo-=t
setlocal fo+=q
setlocal wrap
setlocal linebreak
setlocal breakindentopt=shift:0
setlocal nonumber

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
