call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jwalton512/vim-blade'
Plug 'mbbill/undotree'
"Plug 'gruvbox-community/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'udalov/kotlin-vim'
Plug 'igankevich/mesonic'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'pangloss/vim-javascript'
call plug#end()

"colorscheme gruvbox
"set background=light
colo peachpuff

"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_invert_selection = '0'

"let g:airline_powerline_fonts=1

set colorcolumn=100

filetype plugin indent on
syntax on

set clipboard+=unnamedplus

set noerrorbells
set hidden

"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
set smartindent
set autoindent

set encoding=utf-8
set scrolloff=3

"set termguicolors
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

set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

let mapleader = " "

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_sort_sequence="[\/]$,*"
"let g:gitgutter_map_keys=0

let g:coc_filetype_map = {
  \ 'blade': 'html',
  \ }

set signcolumn=yes
set updatetime=40

"hi GitGutterAdd    guifg=#009900 ctermfg=2
"hi GitGutterChange guifg=#bbbb00 ctermfg=3
"hi GitGutterDelete guifg=#ff2222 ctermfg=1
hi Visual cterm=NONE ctermfg=NONE ctermbg=238
hi IncSearch cterm=NONE ctermfg=NONE ctermbg=238

"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11 -O2 -Wall '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
"autocmd filetype php nnoremap <F4> :w <bar> exec '!php -f '.shellescape('%')<CR>

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
"nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>m <C-W>_<C-W><bar>
nnoremap <leader>cS :CocSearch <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ph <Plug>(GitGutterPreviewHunk)
"nmap <leader>] <Plug>(GitGutterNextHunk)
"nmap <leader>[ <Plug>(GitGutterPrevHunk)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cg <Plug>(coc-declaration)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>cs <Plug>(coc-references)
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>y <Plug>(coc-diagnostic-prev)

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

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
