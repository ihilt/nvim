call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'udalov/kotlin-vim'
Plug 'igankevich/mesonic'
Plug 'puremourning/vimspector'
Plug 'pangloss/vim-javascript'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

set colorcolumn=100

filetype plugin indent on
syntax on

set clipboard+=unnamedplus

set noerrorbells
set hidden

set smartindent
set autoindent
set noexpandtab
set shiftwidth=8

set encoding=utf-8
set scrolloff=3

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
set title

let mapleader = " "

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_sort_sequence="[\/]$,*"

let g:coc_filetype_map = {
  \ 'blade': 'html',
  \ }

"set signcolumn=yes
set updatetime=40

autocmd filetype c   nnoremap <F8> :exec '!clang-format -style=file -i '.shellescape('%')<CR>
autocmd filetype cpp nnoremap <F8> :exec '!clang-format -style=file -i '.shellescape('%')<CR>

"if executable('rg')
"    let g:rg_derive_root='true'
"endif

"function! RipgrepFzf(query, fullscreen)
"  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"  let initial_command = printf(command_fmt, shellescape(a:query))
"  let reload_command = printf(command_fmt, '{q}')
"  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"endfunction

"command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope git_files<cr>
nnoremap <leader>r <cmd>Telescope live_grep<cr>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>b <cmd>Telescope buffers sort_lastused=true<cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>m <C-W>_<C-W><bar>
nnoremap <leader>cS :CocSearch <C-R>=expand("<cword>")<CR><CR>
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
"nnoremap <leader>m :MaximizerToggle!<CR>
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
