call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jwalton512/vim-blade'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'udalov/kotlin-vim'
Plug 'igankevich/mesonic'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

autocmd vimenter * colorscheme gruvbox
autocmd vimenter * AirlineTheme gruvbox

set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection = '0'

set colorcolumn=80

filetype plugin indent on
syntax on

set clipboard+=unnamedplus

set noerrorbells
set hidden

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set smartindent

set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set mouse=a

set noswapfile
set nobackup
set undodir=~/.cache/undodir
set undofile

set wildmenu
set wildmode=list:longest
set number
set path+=**
set nohlsearch
set incsearch
set noshowmatch
set smartcase

set nowrap
set rnu

let mapleader = " "

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
"let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_sort_sequence="[\/]$,*"
let g:gitgutter_map_keys=0

let g:coc_filetype_map = {
  \ 'blade': 'html',
  \ }

set signcolumn=yes
set updatetime=40

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11 -O2 -Wall '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype php nnoremap <F4> :w <bar> exec '!php -f '.shellescape('%')<CR>

if executable('rg')
    let g:rg_derive_root='true'
endif


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :RG<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>m <C-W>_<C-W><bar>
nnoremap <leader>cS :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ph <Plug>(GitGutterPreviewHunk)
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cg <Plug>(coc-declaration)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>cs <Plug>(coc-references)
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>y <Plug>(coc-diagnostic-prev)

" Format
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()
