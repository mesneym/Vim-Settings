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
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()


"#############################################################################################
"					                   GENERAL OPTIONS	
"#############################################################################################
set number numberwidth=2
set noswapfile
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set relativenumber


"#############################################################################################
"                                GENERAL PLUGIN CONFIGURATION
"#############################################################################################

"_____________________________________
"              NERD TREE
"_____________________________________
nnoremap <C-b> :NERDTreeToggle<CR>


"_____________________________________
"			   NEOMAKE
"_____________________________________
let g:neomake_open_list=2
augroup neo
	autocmd!
	autocmd BufWritePost,BufEnter * Neomake
augroup END

"______________________________________
"              Gruvbox
"______________________________________
set background=dark
let g:gruvbox_contrast_dark="hard"
"set background=light
"let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic = 1 
let g:gruvbox_improved_warnigns = 1
colorscheme gruvbox

"_____________________________________
"             Vim Airline
"_____________________________________
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

"
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
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> "+y
nnoremap <C-v> "+p
vnoremap <C-c> "+y
vnoremap <C-v> "+p
nnoremap <leader>dk :m .+1<CR>==
nnoremap <leader>fj :m .-2<CR>==
inoremap <leader>dk <ESC>:m .+1<CR>==gi
inoremap <leader>fj <ESC>:m .-2<CR>==gi
vnoremap <leader>dk :m '>+1<CR>gv=gv
vnoremap <leader>fj :m '<-2<CR>gv=gv


