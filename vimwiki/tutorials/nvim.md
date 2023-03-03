
# Neovim Installation
https://github.com/neovim/neovim/wiki/Installing-Neovim Install neovim with version >= 0.5(nightly)

## Plugin Manager 
Install any plugin manager of your choice.Personally I prefer vim-plug
https://github.com/junegunn/vim-plug


### Plugins and Configuration
* Open/create init.vim  in ~/.config/nvim/init.vim 
* Add line Plug 'url'. Example Plug 'jiangmiao/auto-pairs' installs *autopairs plugin* https://github.com/jiangmiao/auto-pairs
* In normal mode, enter `:PlugInstall` to install plugin

#### CoC LSP Plugin 
Install coc plugin with `Plug 'neoclide/coc.nvim', {'branch': 'release'}`
Refer to https://github.com/neoclide/coc.nvim for installation of coc. 


I personally use coc with extension coc-clangd for c++. coc-ccls also works really well 
.In normal mode enter `:CocInstall coc-clangd` to install coc-clangd

### Basic init.vim config
```
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'


"_______________________________
"      Autopairs
"________________________________
let g:AutoPairsShortcutFastWrap = '<A-e>'
let g:AutoPairsFlyMode = 1

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
```

* Copy and paste in init.vim 
* In normal mode type `:PlugInstall`

Attached is a copy of my init.vim




