call plug#begin('~/.config/nvim/plugged')
"Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
"Plug 'git@github.com:ludovicchabant/vim-gutentags.git'
"Plug 'skywind3000/gutentags_plus'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jwalton512/vim-blade'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'ThePrimeagen/vim-be-good'
call plug#end()

colorscheme gruvbox
set background=dark

set textwidth=80
set colorcolumn=80

filetype plugin indent on
syntax on
set noerrorbells

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent

set noswapfile
set nobackup
set undodir=~/.cache/undodir
set undofile

set wildmenu
set wildmode=list:longest
set number
set path+=**
set incsearch

set wrap
set linebreak
set breakindent
set breakindentopt=shift:2
set nolist

let mapleader = " "

let g:netrw_banner=0
let g:netrw_browse_split=4
"let g:netrw_winsize=80
let g:netrw_altv=1
let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:gutentags_modules=['ctags', 'gtags_cscope']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_caching=0
let g:gitgutter_map_keys=0

set signcolumn=yes
set updatetime=40
set mouse=a

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11 -O2 -Wall '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype php nnoremap <F4> :w <bar> exec '!php -f '.shellescape('%')<CR>
"autocmd vimenter * colorscheme gruvbox

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>b :ls<CR>:b
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>
nmap <leader>ph <Plug>(GitGutterPreviewHunk)
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)
"nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cg <Plug>(coc-declaration)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>cs <Plug>(coc-references)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>y <Plug>(coc-diagnostic-prev)
