"lineas primordiales, estas lineas son para indicar en el archivo de vim que
"use esta configuracion
"^ con ALT + 94 ^
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
"Ahora si a configurar

" ********************************************************************************************
"~ Intalamos Plugins con  el manejador de plug-ig, e indicamos donde guardamos nuestros plugin
" ********************************************************************************************

call plug#begin('~/.local/share/nvim/plugged')

"install my theme
Plug 'morhetz/gruvbox', {'as' : 'gruvbox'} 

"instalamos el ease motion
Plug 'easymotion/vim-easymotion'
      "nos permite navegar, saltar a otro punto desde nuestro codigo de manera sencilla

"instalamos nerdTree
Plug 'scrooloose/nerdtree'
  "este es en si el nerd tree

"agregando el autocompletado
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"para que la barra inferior sea bonita
Plug 'vim-airline/vim-airline'
"el tema de la barra inferior
Plug 'vim-airline/vim-airline-themes'

"mostrar errores
Plug 'dense-analysis/ale'

"para autocerrar etiquetas
Plug 'alvan/vim-closetag'

"para ver iconos en mis navegaciones
Plug 'ryanoasis/vim-devicons'

"instalar los plug para el uso del nerdtree 
Plug 'Xuyuanp/nerdtree-git-plugin'

"muestra cierta opciones visuales en la ventanas del nerdtree
Plug 'PhilRunninger/nerdtree-visual-selection'

"######################### End Call PlugIn
call plug#end()

"*****************************************************************************
""~ Vim-Plug core, lineas rocomendadas de boostrap-vim
"*****************************************************************************


let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let g:vim_bootstrap_theme = "gruvbox"
let g:vim_bootstrap_frams = ""
let g:vim_bootstrap_langs = "c,html,javascript,python,typescript"
let g:vim_bootstrap_editor = "nvim"		

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif



"*****************************************************************************
""~ configuracion base / base config
"*****************************************************************************


setnumber 
    "genera los numeros del costado izq
set title
    " Muestra el nombre del archivo en la ventana de la terminal
set mouse=a 
    "Permite la integración del mouse (seleccionar texto, mover el cursor)
set numberwidth=3
    "indica el ancho de los numeros del costado IZQ
set clipboard=unnamed 
    "para indicar que mis datois del clipborad ingresen a vim
syntax enable
    "para habilitar la sintaxis de la linea superior dentro de vim
syntax on
    "para habilitar los colores de sintansix  fuera delthema, o los que trae
    "definidos nvim por default
set showcmd 
    "muertra los comando que se estan usando
set ruler
    "muestra lo poscicion en la parte inferior derecha linea,caracter
set cursorline 
    "muestra la linea dek lugar donde se ubica el cursor
set encoding=utf-8
    "seteamos la codificacion de archivos
set showmatch 
    "muestra el parentesis pareja
set sw=2
  "para identar con dos espacios 
set relativenumber 
	"depende de la pocicion del cursor indic a la pocicion
	"para arriba y abajo con cero en la ubicacion

set laststatus=2 "para que la barra inferior siempre sea visible
set noshowmode 
    "para que no muestre el modo en la barra inferior

set shiftwidth=2
set tabstop=2
    "para la identacion siempre sea de 4 espacion

set expandtab
  "hace que los tabuladores se comviertan en espacios
set autoindent
  "para que cuando demos click la siguiente linea se autoidente
  "automaticamente
filetype indent on
    "permite insertar tabulaciones de manera que cuando venga la siguiente
    "linea me permita seguir alli y/o conservar el identado que se lleva
set hidden
    "este oculta elementos no necesarios a la hora de autocmopletar

set guifont=DroidSansMono_Nerd_Font:h11
    "esta es para que la fuente del nerdtree no se desborde

set foldmethod=syntax
    "este es para permitir los plieges, segun la sintansix de la aplicacion.
    "como uso C# deberia de funcionar con las regiones, queda de maravilla..
    "ahora deberia de configuarra mi tecla leader para esto
"End of basic config
set background=dark
  "aqui activamos los efectos visuales de un fondo oscuro
set ignorecase	
  " para que ignore direfencia entre MAY y min
set nohlsearch
  "segun solo resalta las proximas busquedas

"*****************************************************************************
""~ esta configuracion la recomieda la gente de COC el autocompletar. 
"*****************************************************************************

"## === para los autocmpletados del coc. === ##
"esta es la lista de los elementos que se instalan si no existen en el sistema
let g:coc_global_extensions=[ 'coc-explorer', 'coc-eslint', 'coc-omnisharp', 'coc-angular', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-snippets' ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>r  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"*****************************************************************************
""~ configurando los snippets de coc
"*****************************************************************************

"usando <tab> para seleccionar el snippets 
inoremap <silent><expr> <space><space>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = 'n'


"*****************************************************************************
""~ leader schort ||  asignacion de mi tecla lider [espacio]
"*****************************************************************************
"asigno mi tecla leader
let mapleader = " "


"*****************************************************************************
""~ Configurraciones de cada plug, theme and shortcuts
"*****************************************************************************

" ##  ====================== asigno mis teclas, teclas de uso primitivo

"aqui asingno salto de linea de 10 espacios usando control + movimiento 
nmap <C-j> 10j
nmap <C-k> 10k
nmap <C-h> 10h
nmap <C-l> 10l

"asigno los shortcuts para guardar y cerar
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>v :v<CR>


"cambiar tamaño de la fuente
let s:fontsize = 14
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a



" ## === Conf Theme gruvbox === ## 

colorscheme gruvbox
let g:gruvbox_contrast_dark = "medium"
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0
let g:gruvbox_transparent_bg=1
let g:gruvbox_number_column="#663A8B"
let g:gruvbox_italicize_comments = 1


" ### === ### para el easy motion
nmap <leader>s <Plug>(easymotion-s2)
    "en teoria al precionar espacio+s; me permite llegar facil a otro punto


" ##########################  ===   ##########################
" para el NERDtree 
" ##########################  ===   ##########################

nmap <leader>nt :NERDTreeFind<CR>
    "para que se vea el arbolito
let NERDTreeQuitOnOpen=1
    "para cerrar el arbol apenas elija un elemento
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
        " Organiza los elementos
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
        " ignaro elementos con estas extenciones
let g:NERDTreeChDirMode=2
        "tipo de direcctorio
let g:NERDTreeShowBookmarks=1
        "para mostrar los marcadores en caso de que existan
let g:nerdtree_tabs_focus_on_files=1
        " ??
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
        "abre elementos con click derecho
let g:NERDTreeWinSize = 50
        " ??
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
    "para buscar o subir los archivbos un ecaldon
nnoremap <silent> <F3> :NERDTreeToggle<CR>
   "para cambiar de elemento

"Plug para el plug
"es par la muestra del nerd tree 
"esto es para la vistas del las opciones de git a la hora de observar la
"carpeta...
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"para que muestre las fuentes ya instaldas
let g:NERDTreeGitStatusUseNerdFonts = 1
" para que me muestre los archivos ignorados
let g:NERDTreeGitStatusShowIgnored = 1 

" ##########################  ===   ##########################
" ##########################  ===   ##########################

" ### === ### vim-airline

let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

let g:airline#extensions#virtualenv#enabled = 1

let g:airline_theme='minimalist'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


" ### === ### dense-analysis/ale

let g:ale_linters = {}
" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline 
let g:airline#extensions#virtualenv#enabled = 1


" ### === ### IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '|' "'┆'
  let g:indentLine_faster = 1


"*****************************************************************************
"" Custom configs for lenguages
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=4 sw=4 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
let python_highlight_all = 1


" typescript
let g:yats_host_keyword = 1


" typescript
let g:yats_host_keyword = 1

"configuracion de mi gsiano/vmux-clipboard, el plug del portapales
map <silent> <leader>y :WriteToVmuxClipboard<cr>
map <silent> <leader>p :ReadFromVmuxClipboard<cr>


