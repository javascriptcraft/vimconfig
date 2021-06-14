
call plug#begin('~/.config/nvim/autoload/plugged')

" Theme
" Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'connorholyday/vim-snazzy'
Plug 'arzg/vim-colors-xcode'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'


" open File
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Language Support
Plug 'sheerun/vim-polyglot'

Plug 'Chiel92/vim-autoformat'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-wiki
Plug 'vimwiki/vimwiki'

" code commenting
Plug 'preservim/nerdcommenter'

"search
Plug 'mhinz/vim-grepper'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterEnable'}

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"surround
Plug 'tpope/vim-surround'

"autocompltete the pairs
Plug 'jiangmiao/auto-pairs'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

" js-jsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()
set termguicolors
"colorscheme onehalfdark
syntax enable
set background=light
colorscheme onedark

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

let mapleader = " " " map leader to Space


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
let g:NERDTreeChDirMode = 2
" Automaticaly close nvim if NERDTree is only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
"nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <Leader>a :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

inoremap jj <Esc>
tnoremap jj <C-\><C-n>
" open new split panes to right and below
set splitright
set splitbelow
highlight VertSplit cterm=NONE
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
      split term://bash
      resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <Leader>j <C-\><C-n><C-w>j
tnoremap <Leader>h <C-\><C-n><C-w>h
tnoremap <Leader>l <C-\><C-n><C-w>l
tnoremap <Leader>k <C-\><C-n><C-w>k
nnoremap <Leader>j <C-w>j
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k

" open file config
nnoremap <C-p> :FZF<CR>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
"nnoremap <expr> <Leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
"let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }


nnoremap <leader>w :CtrlSF
nmap   <leader>n <Plug>CtrlSFCwordPath <CR>
" enable the copy to clip board
set clipboard=unnamed
set number

set foldmethod=syntax "syntax highlighting items specify folds
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

nmap <Leader>r :set invrelativenumber<CR>

" keymap to fold methods and code
inoremap <F6> <C-O>za
nnoremap <F6> za
onoremap <F6> <C-C>za
vnoremap <F6> zf



" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
noremap <F5> :Autoformat<CR>
"au BufWrite * :Autoformat


set cursorline

let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_async=0
nmap <Leader>gg :GitGutterEnable<CR>
set statusline+=%{FugitiveStatusline()}

"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -O2 -Wall -Wextra -DLOCAL -o %:r -Wl,--stack,268435456<CR>
"autocmd filetype cpp nnoremap <F10> :!%:r<CR>


"custom setting to open project in office
nnoremap <Leader>1 :cd C:\Users\PraveeYadav\AppData\Local\nvim  <CR>
nnoremap <Leader>2 :cd C:\Users\PraveeYadav\Documents\Pflizer\Dev\vaca-post-deal-monitoring-webapp<CR>
nnoremap <Leader>3 :cd C:\Users\PraveeYadav\Documents\Pflizer\Dev\vaca-post-deal-monitoring-api<CR>


let g:split_term_style = 'vertical'
set fillchars+=vert:\
hi VertSplit ctermbg=NONE guibg=NONE

"emmet 
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
source ~/.config/nvim/cp.vim
source ~/.config/nvim/coc.vim
