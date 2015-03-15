"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Old version: https://github.com/amix/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ##############################
" SECTION General

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>



" ##############################
" SECTION VIM user interface

" Set x lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=5

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" line numbers
set number
autocmd InsertEnter * :set nonumber
autocmd InsertLeave * :set number

" cursor line
set cursorline

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>



" ##############################
" SECTION Colors and Fonts

" Enable syntax highlighting
syntax enable

"colorscheme desert
"set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


set list listchars=tab:\|\
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=yellow guifg=yellow
"autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=yellow guifg=yellow
match Whitespace /  \+/

"highlight ExtraWhitespace ctermbg=red guibg=red
"call matchadd('ExtraWhitespace', '/\s\+$/')
autocmd BufWritePre * :%s/\s\+$//e

fun! LoadColourScheme(schemes)
    let l:schemes = a:schemes . ":"
    while l:schemes != ""
        let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
        let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)
        try
            exec "colorscheme" l:scheme
            break
        catch
        endtry
    endwhile
endfun

if has('gui')
   call LoadColourScheme("inkpot:night:rainbow_night:darkblue:elflord")
else
   if &t_Co == 88 || &t_Co == 256
       call LoadColourScheme("inkpot:desert256:darkblack:darkblue:elflord")
    else
"       call LoadColourScheme("desert256:darkblack:desert:darkblue:elflord")
"       Colorize some default highlight groups
"       see ":help highlight-default"
"
"            Comments: Colorizing the "comments" (see ":help comments").
"            cyan on white does not look good on a black background..
          hi comment                           ctermfg=cyan   ctermbg=black
"         hi comment                           ctermfg=cyan   ctermbg=7
"
"       hi Cursor
"       hi Directory
"       hi ErrorMsg
"       hi FoldColumn
"       hi Folded
"       hi IncSearch
"
"            LineNr:  Colorize the line numbers (displayed with
"            "set number").
"            Turn off default underlining of line numbers:
          hi LineNr term=NONE cterm=NONE ctermfg=grey ctermbg=black
"
"       hi ModeMsg
"       hi MoreMsg
"
"         coloring "nontext", ie TABs, trailing spaces,  end-of-lines,
"         and the "tilde lines" representing lines after end-of-buffer.
          hi NonText term=NONE cterm=NONE ctermfg=blue   ctermbg=black
"
"            Normal text:    Use white on black.
"         hi normal ctermfg=white ctermbg=black guifg=white guibg=black
          hi normal ctermfg=grey  ctermbg=black guifg=grey guibg=black
"       Oops - this overrides the colors for the status line - DANG!
"
"       hi Question
"
"            Search: Coloring "search matches".  Use white on red.
          hi search  ctermfg=white ctermbg=red     guifg=white guibg=red
"
"         hi SpecialKey
"
"            statusline: coloring the status line -> is not possible :-(
"         hi StatusLine  term=NONE cterm=NONE ctermfg=yellow ctermbg=red
"
"         hi Title
"         hi VertSplit
"         hi Visual
"         hi VisualNOS
"         hi WarningMsg
"         hi WildMenu
"
"         Other Groups:
"
"            Normal:  Coloring the text with a default color.
          hi normal       term=NONE
    endif
endif



" ##############################
" SECTION Files, backups and undo

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
"set noswapfile



" ##############################
" SECTION Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
"set lbr
"set tw=500

"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines
set nowrap



" ##############################
" SECTION Visual mode related

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>



" ##############################
" SECTION Moving around, tabs, windows and buffers

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=%



" ##############################
" SECTION Status line

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ \ %<%F\ \ \ \ %h%w%m%r%y[%{&encoding}][%{&fileformat}]%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}\ \



" ##############################
" SECTION Editing mappings

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()



" ##############################
" SECTION Spell checking

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=



" ##############################
" Misc

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
set pastetoggle=<F2>

" Extra terminal things
if (($TERM == "rxvt-unicode") || ($TERM =~ "xterm") || ($TERM =~ "screen")) && (&termencoding == "")
    set termencoding=utf-8
endif

"     compatible:  Let Vim behave like Vi?  Hell, no!
set nocompatible

set viminfo='1000,f1,:1000,/1000

set noerrorbells
set visualbell t_vb=
if has("autocmd")
    autocmd GUIEnter * set visualbell t_vb=
endif

set showcmd
set showfulltag
set showmode

set scrolloff=4
set sidescrolloff=2
set noicon

"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list



" ##############################
" SECTION Helper functions

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction



" ##############################
" SECTION PATHOGEN

call pathogen#infect()
syntax on
filetype plugin indent on

set modeline
set modelines=5

let g:vim_markdown_folding_disabled=1



" ##############################
" SECTION NERDTREE
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" ##############################
" SECTION SYNTASTIC
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0



" ##############################
" SECTION NEOCOMPLETE

"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"
"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
