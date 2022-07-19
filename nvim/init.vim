
"###########################################################################################
"											PLUGINS
"############################################################################################
call plug#begin()

"________________________________
"			GENERAL
"________________________________
Plug 'jiangmiao/auto-pairs'
Plug 'simeji/winresizer'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree' 
Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-fugitive'
Plug 'timakro/vim-searchant'
Plug 'joshdick/onedark.vim'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'lervag/vimtex'
Plug 'daeyun/vim-matlab' 
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn insrtall'  }
Plug '907th/vim-auto-save'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'justinmk/vim-sneak'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'alepez/vim-gtest'
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'

Plug 'cdelledonne/vim-cmake'
if has("nvim")
  Plug 'antoinemadec/FixCursorHold.nvim'
endif

"Plug 'daeyun/vim-matlab' 
"Plug 'Shougo/neoinclude.vio'
"Plug 'neomake/neomake'
"Plug 'kien/ctrlp.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'takac/vim-hardtime'
call plug#end()


"#############################################################################################
"					                   GENERAL Settings
"#############################################################################################
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
set nowrap
set clipboard=unnamedplus

"settings for vimwiki
set nocompatible
filetype plugin on
syntax on


"#############################################################################################
"					                   KEY  MAPPINGS
"#############################################################################################

"______________________
" General Keymappings
"______________________
let mapleader=","
let maplocalleader = "\<space>"
inoremap    jk              <ESC>
tnoremap    jk              <c-\><c-n> 
nnoremap    <leader>ev      :vsplit $MYVIMRC<CR>
nnoremap    <leader>sv      :source $MYVIMRC<CR>
nnoremap    <leader>w       :wall<CR>
vnoremap    <leader>pc      :w !bash<cr> 
nnoremap    <leader>fq      :q!<CR>
nnoremap    gb              gT

nnoremap    <C-h>           <C-w>h
nnoremap    <C-j>           <C-w>j
nnoremap    <C-k>           <C-w>k
nnoremap    <C-l>           <C-w>l
tnoremap    <C-h>           <C-\><C-N><C-w>h
tnoremap    <C-l>           <C-\><C-N><C-w>l
tnoremap    <C-k>           <C-\><C-N><C-w>k
tnoremap    <C-j>           <C-\><C-N><C-w>j

"nnoremap <leader>vt :vsp<CR> :term <CR>a
"nnoremap <leader>tt :sp<CR> :term <CR>a
"tnoremap <leader>tt <C-\><C-n> :bd!<CR>
vnoremap    <C-j>           :m '>+1<CR>gv=gv
vnoremap    <C-k>           :m '<-2<CR>gv=gv


"Better tabbing"
vnoremap < <gv
vnoremap > >gv


autocmd FileType python nnoremap <buffer> <F5>  :w<CR>:!python % <CR>
"autocmd filetype cpp nnoremap <buffer> <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r.out && %:r.out <cr>
"autocmd filetype cpp nnoremap <buffer> <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -pthread -ggdb -o %:p:h/main && %:p:h/main <cr>
"autocmd filetype cpp nnoremap <buffer> <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:p:h/main && %:p:h/main <cr>
autocmd filetype cpp nnoremap <buffer> <F5> :!./Debug/main <CR>


"#############################################################################################
"                                GENERAL PLUGIN CONFIGURATION
"#############################################################################################

"_______________________________
"      Vim Wiki
"_______________________________
let g:vimwiki_list = [{'path':'/home/aobeng/vimwiki','syntax':'markdown','ext':'.md'}]
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown'}
let g:vimwiki_markdown_link_ext=1

"_______________________________
"     Task Wiki
"_______________________________
"
let g:taskwiki_maplocalleader="\\t"


"_______________________________
"      NerdCommenter
"_______________________________
let g:NERDCreateDefaultMappings = 1

"_______________________________
"       Vim rooter
"_______________________________
let g:rooter_patterns = ['.ccls','.git','.gitignore', 'Makefile', '*.sln', 'build/env.sh']

"_______________________________
"      Sneak
"_______________________________
let g:sneak#label = 1

"_______________________________
"      Startify
"_______________________________

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Project Directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

let g:startify_bookmarks = [
      \ { 'i': '~/.config/nvim/init.vim' },
      \ { 'c': '~/.config/nvim/coc-settings.json' },
      \ { 'b': '~/.bashrc' },
      \ { 'p': '~/Vim-Settings/projectcreate.bash'}
      \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.config/nvim/session'
nnoremap <C-s> :Startify<cr>



"_______________________________
"       Which Key
"_______________________________
call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader>           :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader>           :<c-u>WhichKeyVisual ','<CR>
nnoremap <silent> <localleader>      :<c-u>WhichKey  '<space>'<CR>
vnoremap <silent> <localleader>      :<c-u>WhichKeyVisual '<space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0


"_______________________________
"      Floaterm
"_______________________________
"let g:floaterm_keymap_next   = '<F2>'
"let g:floaterm_keymap_prev   = '<F3>'
"let g:floaterm_keymap_new    = '<F4>'
"let g:floaterm_keymap_toggle = '<F6>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1


"_______________________________
"      AutoSave
"_______________________________
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1 

"_______________________________
"      Win Resizer
"________________________________
let g:winresizer_start_key = '<C-e>'


"_______________________________
"      Lens
"________________________________
nnoremap <C-a>  :call lens#toggle()<CR>
let g:lens#disabled = 1
let g:lens#height_resize_min = 10
let g:lens#width_resize_min = 60
let g:lens#height_resize_max = 30
let g:lsns#width_resize_max = 120
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

"_______________________________
"      Autopairs
"________________________________
let g:AutoPairsShortcutFastWrap = '<A-e>'

"_______________________________
"      Markdown
"_______________________________
let g:mkdp_auto_close = 1
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1

nnoremap <C-m>  <Plug>MarkdownPreview

"_______________________________
"        Fzf
"_______________________________

autocmd FileType fzf tnoremap <buffer> <C-j>  <C-n>
autocmd FileType fzf tnoremap <buffer> <C-k>  <C-p>
autocmd FileType fzf tnoremap <buffer> <C-h>  <C-x> 

"Get text in files with Rg"
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)


"Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


" Git grep
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



"_______________________________
"         CtrlP
"________________________________         
"let g:ctrlp_working_path_mode = 'rw'


"_______________________
"		NEOINCLUDE
"_______________________
"let g:neoinclude#_paths = '/usr/include/eigen3/'

"_____________________________________
"       vim - Hardtime
"_____________________________________
let g:hardtime_default_on = 1

"_____________________________________
"        Coc Explorer / Nerd Tree 
"_____________________________________
"
"nnoremap <C-b> :NERDTreeToggle %<CR> 
"nnoremap <C-n> :NERDTree `pwd`<CR>
nnoremap <C-b> :CocCommand explorer<CR>

"_____________________________________
"        Coc Explorer / Nerd Tree 
"_____________________________________
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"______________________________________
"              Gruvbox
"______________________________________
"set background=dark
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

"nnoremap  <space>p :lprev<cr>
"nnoremap  <space>n :lnext<cr>
"nnoremap  <space>a :lopen<cr>


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


"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"nmap <silent> <space>p  <Plug>(coc-diagnostic-prev)
"nmap <silent> <space>n  <Plug>(coc-diagnostic-next)


command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
autocmd CursorHold * silent call CocActionAsync('highlight')


"Navigation
"nmap <silent> <space>gv :call CocAction('jumpDefinition', 'vsplit')<cr>
"nmap <silent> <space>gd <Plug>(coc-definition)
"nmap <silent> <space>gr <Plug>(coc-references)
"nmap <silent> <space>gy <Plug>(coc-type-definition)

"Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)


"nmap <silent> <space>rn <Plug>(coc-rename)
"nmap <silent> <space>rf <Plug>(coc-refactor)
"xmap <silent> <space>fm  <Plug>(coc-format-selected)
"nmap <silent> <space>fm  <Plug>(coc-format-selected)
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"nnoremap <silent> <space>fd :Fold <cr>



"______________________________________
"           Vimtex 
"______________________________________
let g:tex_flavor  = 'latex'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'


"______________________________________
"            Vim Searchant
"______________________________________
highlight SearchCurrent ctermbg = blue



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
"


"##################################################################################
"                                 Cpp Plugins
"###########################################################################

"_______________________________________
"         Cmake
"_______________________________________
let g:cmake_link_compile_commands = 1
autocmd FileType cpp nnoremap <localleader>cg :CMakeGenerate<cr>
autocmd FileType cpp nnoremap <localleader>cb :CMakeBuild<cr>
autocmd FileType cpp nnoremap <localleader>cc :CMakeClean<cr>
autocmd FileType cpp nnoremap <localleader>cq :CMakeClose<cr>
autocmd FileType cpp nnoremap <localleader>co :CMakeOpen<cr>

"______________________________________
"        Gtest
"______________________________________
let g:gtest#gtest_command = getcwd().'/Debug/test/main_test'
autocmd FileType cpp nnoremap <localleader>gt :GTestRunUnderCursor<cr>




"#############################################################################################
"					                         Special KEY  MAPPINGS
"#############################################################################################

"__________________________________________________________
"
"                       TERMINAL
"_________________________________________________________

""""""""""""""""""""""""""
"Floaterm KEY BINDINGS
""""""""""""""""""""""""""

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'v' : [':FloatermNew --wintype=vsplit --width=0.5'      , 'vterminal'],
      \ 'x' : [':FloatermNew --wintype=split --height=0.3'      , 'hterminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'o' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'n' : [':FloatermNew'                                   , 'New'],
      \ 'f' : [':FloatermNext'                                  , 'Next'],
      \ 'b' : [':FloatermPrev'                                  , 'Prev'],
      \ }

tnoremap   <silent>   <leader>tt   <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <leader>tx   <C-\><C-n>:FloatermNew --wintype=split --height=0.3<CR>
tnoremap   <silent>   <leader>tv   <C-\><C-n>:FloatermNew --wintype=vsplit --width=0.5<CR>
tnoremap   <silent>   <leader>tn   <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <leader>tf   <C-\><C-n>:FloatermNext<CR>
tnoremap   <silent>   <leader>tb   <C-\><C-n>:FloatermPrev<CR>

""""""""""""""""""""""
"CUSTOM KEY BINDINGS
""""""""""""""""""""""
:call extend(g:which_key_map.t, {    'm' : ['o<ESC>k,vtjk,vtjk<C-h><C-h>,fqi'                , 'multi-term'],
      \ 'dm': [',fq,fq'                                         , 'del-multi_term'],
      \})



"____________________________________________________________
"                          SEARCHING
"___________________________________________________________

""""""""""""""""""""
"FZF KEY BINDINGS
""""""""""""""""""""
" key -> Dependency"
" | Tags -> UltiSnips | Commits -> Fugitive | Tags -> ctags -R | Ag -> ag | Rg -> rg
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 't' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 'r' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }


""""""""""""""""""
"COC KEY BINDINGS
""""""""""""""""""
call extend(g:which_key_map.s, { 'd' : [':CocCommand fzf-preview.DirectoryFiles'              , 'directories'],
      \})


"_______________________________________________________________
"                        GIT
"_______________________________________________________________

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }


"___________________________________________________________________
"                             LSP
"___________________________________________________________________
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

xmap <leader>lx  <Plug>(coc-convert-snippet)


"___________________________________________________________________
"                             Debug
"___________________________________________________________________

" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint'   , 'conditional breakpoint'],
      \ 'c' : ['<Plug>VimspectorRunToCursor'                   , 'run to cursor'],
      \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'         , 'function breakpoint'],
      \ 'p' : ['<Plug>VimspectorPause'                         , 'pause'],
      \ 'r' : ['<Plug>VimspectorRestart'                       , 'restart'],
      \ 's' : ['<Plug>VimspectorStop'                          , 'stop'],
      \ 'd' : ['<Plug>VimspectorContinue'                      , 'start/continue'],
      \ 'x' : [':VimspectorReset'                              , 'close'],
      \ 'o' : ['<Plug>VimspectorStepOver'                      , 'step over'],
      \ 'O' : ['<Plug>VimspectorStepOut'                       , 'step out'],
      \ 'i' : ['<Plug>VimspectorStepInto'                      , 'step into'],
      \ 'b' : ['<Plug>VimspectorToggleBreakpoint'              , 'breakpoint'],
      \ 'I' : ['<Plug>VimspectorBalloonEval'                   , 'insepect under cursor'],
      \ 'S' : ['<Plug>VimspectorShowOutput'                    , 'show output'],
      \ 'C' : [':call vimspector#ClearBreakpoints()'           , 'clear allbreakpoints']
      \ }

nnoremap <leader>de    :VimspectorEval
nnoremap <leader>dw    :VimspectorWatch
xmap     <Leader>dI    <Plug>VimspectorBalloonEval


"___________________________________________________________________
"                        Project management
"___________________________________________________________________
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 'S' : [':SSave'           , 'Save Session']   ,
      \ }

      "\ 's' : [':Startify'        , 'Start Page']     ,

