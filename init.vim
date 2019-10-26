"############################################################################################
"											PLUGINS
"############################################################################################
call plug#begin()

"________________________________
"			GENERAL
"________________________________
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'kien/ctrlp.vim'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neoinclude.vio'
Plug 'timakro/vim-searchant'
call plug#end()


"#############################################################################################
"					                   GENERAL OPTIONS	
"#############################################################################################
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""
set number numberwidth=2
set noswapfile
set shiftwidth=2
set tabstop=4
set softtabstop=4
set incsearch
set noexpandtab
set mouse=a
set relativenumber
set splitright
set splitbelow

"#############################################################################################
"                                GENERAL PLUGIN CONFIGURATION
"#############################################################################################

"_______________________________
"         CTRLP
"________________________________         
let g:ctrlp_working_path_mode = 'rw'

"_______________________
"		NEOINCLUDE
"_______________________
"let g:neoinclude#_paths = '/usr/include/eigen3/'

"_____________________________________
"       vim - Hardtime
"_____________________________________
let g:hardtime_default_on = 1

"_____________________________________
"              NERD TREE 
"_____________________________________
"
nnoremap <C-b> :NERDTreeToggle %<CR> 
nnoremap <C-n> :NERDTree `pwd`<CR>



"______________________________________
"              Gruvbox
"______________________________________
set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic = 1 
let g:gruvbox_improved_warnigns = 1
colorscheme gruvbox

"_____________________________________
"             Vim Airline
"_____________________________________
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


"_____________________________________
"            Coc Nvim
"______________________________________
set cmdheight=2  "Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes "always show sign columns"

inoremap <silent><expr> <TAB> 
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nmap <silent> <space>p  <Plug>(coc-diagnostic-prev)
nmap <silent> <space>n  <Plug>(coc-diagnostic-next)


"______________________________________
"            Vim Searchant
"______________________________________
highlight SearchCurrent ctermbg = blue

"#############################################################################################
"					                   KEY  MAPPINGS
"#############################################################################################

"______________________
" General Keymappings
"______________________
let mapleader=","
let maplocalleader = "\\"
inoremap    jk              <ESC>
nnoremap    <leader>ev      :vsplit $MYVIMRC<CR>
nnoremap    <leader>sv      :source $MYVIMRC<CR>
inoremap    <leader>.       <ESC>$a
nnoremap    <leader>.       $a
inoremap    <leader>w       <ESC>:w<CR>i
nnoremap    <leader>w        :w<CR>
nnoremap	<leader>fq       :q!<CR>
nnoremap	<leader>wq       :wq!<CR> 
nnoremap    gb               gT
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>dk :m .+1<CR>==
nnoremap <leader>fj :m .-2<CR>==
inoremap <leader>dk <ESC>:m .+1<CR>==gi
inoremap <leader>fj <ESC>:m .-2<CR>==gi
vnoremap <leader>dk :m '>+1<CR>gv=gv
vnoremap <leader>fj :m '<-2<CR>gv=gv
nnoremap <leader>vt :vsp<CR> :term <CR>a
nnoremap <leader>tt :sp<CR> :term <CR>a
tnoremap <leader>tt <C-\><C-n> :bd!<CR>
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-j> <C-\><C-N><C-w>j


