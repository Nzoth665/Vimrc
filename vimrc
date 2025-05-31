if v:progname =~? "evim"
  finish
endif

source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup
else
  set backup
  if has('persistent_undo')
    set undofile
  endif
endif

if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78
augroup END

if has('syntax') && has('eval')
  packadd! matchit
endif

" Настройка через set
set number
set relativenumber
set nocompatible
filetype plugin on
syntax on

set tabstop=4       " ширина таба в пробелах
set shiftwidth=4    " ширина сдвига (>>, <<)
set expandtab       " заменять табы на пробелы
set smarttab        " умная обработка табов

" Поиск
set ignorecase      " игнорировать регистр при поиске
set smartcase       " если есть символы в верхнем регистре - учитывать регистр
set incsearch       " инкрементальный поиск
" set hlsearch        " подсвечивать найденное

" Перенос строк
set wrap            " переносить длинные строки
set linebreak       " переносить по словам, а не по символам

" Дополнительные удобства
set mouse=a         " включить мышь во всех режимах
" set cursorline      " подсвечивать текущую строку
set showmatch       " показывать совпадение скобок
set clipboard=unnamedplus " использовать системный буфер обмена

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'wadackel/vim-dogrun'
Plug 'EdenEast/nightfox.nvim'
Plug 'nikolvs/vim-sunbather'
Plug 'https://github.com/nordtheme/vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" #colorscheme
" colorscheme embark
" colorscheme dogrun
" colorscheme sunbather
" colorscheme nord
" colorscheme onedark
colorscheme nightfox

" Настройка airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Настройка темы (можно выбрать другую)
" let g:airline_theme = 'nord'

" Включение разделителей со скосом
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

highlight LineNr ctermfg=Magenta

" Настройка клавы
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenmac
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=0

" set foldmethod=syntax
" set foldlevel=99
" autocmd FileType python setlocal foldmethod=indent

" nnoremap
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :TagbarToggle<CR>
nnoremap <C-t> :Tagbar<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>n :new<CR>

" inoremap
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
