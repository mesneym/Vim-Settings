"###########################################################################################
"
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
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neoinclude.vio'
Plug 'timakro/vim-searchant'
Plug 'joshdick/onedark.vim'
Plug 'neomake/neomake'
Plug 'lervag/vimtex'
Plug 'daeyun/vim-matlab' 
Plug 'tpope/vim-surround'
"Plug '907th/vim-auto-save'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'takac/vim-hardtime'
call plug#end()


"#############################################################################################
"					                   GENERAL OPTIONS	
"#############################################################################################
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""
set number numberwidth=2
set noswapfile
set shiftwidth=2
set tabstop=2
set incsearch
set expandtab
set mouse=a
set relativenumber
set splitright
set splitbelow


"#############################################################################################
"                                GENERAL PLUGIN CONFIGURATION
"#############################################################################################

"_______________________________
"      AutoSave
"_______________________________
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1 

"_______________________________
"      AutoPairs
"________________________________
let g:AutoPairsShortcutFastWrap = '<A-e>'



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
"set background=light
"let g:gruvbox_contrast_light ='hard'
let g:gruvbox_italic = 1 
let g:gruvbox_improved_warnigns = 1
colorscheme gruvbox

"_____________________________________
"             One Dark
"_____________________________________
"syntax on
"colorscheme onedark
"let g:lightline = {
  "\ 'colorscheme': 'onedark',
  "\ }

"hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
"hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

"_____________________________________
"             Vim Airline
"_____________________________________
let g:airline_powerline_fonts=1
"let g:airline_theme='onedark'
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"______________________________________
"            Neo Make
"______________________________________
"autocmd InsertChange,TextChanged * update | Neomake

"autocmd BufWritePost,BufEnter * Neomake
"let g:neomake_cpp_enabled_makers = ['gcc', 'cppcheck', 'cpplint']
"let g:neomake_cpp_gcc_maker = {
"\ 'exe': 'g++',
"\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-std=c++11'],
"\ }

nnoremap  <space>p :lprev<cr>
nnoremap  <space>n :lnext<cr>
nnoremap  <space>a :lopen<cr>

"_____________________________________
"            Coc Nvim
"______________________________________
set cmdheight=2  "Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes "always show sign columns"
set nobackup  "some servers have issues with backup"
set nowritebackup
set hidden   "if hidden is not set, Text edit might fail"

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nmap <silent> <space>p  <Plug>(coc-diagnostic-prev)
nmap <silent> <space>n  <Plug>(coc-diagnostic-next)


command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <space>gv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> <space>gd <Plug>(coc-definition)
nmap  <space>gy <Plug>(coc-type-definition)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>gi <Plug>(coc-implementation)
xmap <silent> <space>fm  <Plug>(coc-format-selected)
nmap <silent> <space>fm  <Plug>(coc-format-selected)
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>fd :Fold <cr>

"______________________________________
"           Multiple Cursors
"______________________________________
"let g:multi_cursor_use_default_mapping=0

 "Default mapping
"let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-m>'
"let g:multi_cursor_start_key           = 'g<C-m>'
"let g:multi_cursor_select_all_key      = 'g<A-m>'
"let g:multi_cursor_next_key            = '<C-m>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<ESC>'

"______________________________________
"           Vimtex 
"______________________________________
let g:tex_flavor  = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'


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
nnoremap    <leader>.        A
nnoremap    <leader>w        :w<CR>
nnoremap    <leader>fq       :q!<CR>
nnoremap    gb               gT
nnoremap    0                ^
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>dk :m .+1<CR>==
nnoremap <leader>fj :m .-2<CR>==
vnoremap <leader>dk :m '>+1<CR>gv=gv
vnoremap <leader>fj :m '<-2<CR>gv=gv
nnoremap <leader>vt :vsp<CR> :term <CR>a
nnoremap <leader>tt :sp<CR> :term <CR>a
tnoremap <leader>tt <C-\><C-n> :bd!<CR>
tnoremap jk         <C-\><C-n> 
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-j> <C-\><C-N><C-w>j
nmap     <leader>mt  o<ESC>k,ttjk,vt<C-k>,tt<c-k>,fq<c-k>i
nmap     <leader>dmt ,fq,fq,fq



autocmd FileType python nnoremap <buffer> <F5>  :w<CR>:!python % <CR>

