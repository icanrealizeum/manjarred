" text is gray(not white) by default:
colorscheme torte
"colorscheme evening
" :colorscheme molokai
" text is white by default:
" :colorscheme pablo
" :colorscheme desert

" run 'sudo rvim' if you need to run vim as root
"
" run pathogen which makes sure all other plugins are run (sometime later I
" guess, after .vimrc is read) don't run for root:
" //FIXME: this if, isn't working! with su or sudo
" echom $UID
" echom $USER $UID
" won't work with rvim: echom system('id -u') 1
" XXX: when you want to see .wofl while root, uncomment the if, and allow the
" execute
if $HOME != "/root"
	execute pathogen#infect()
endif

" remember last cursor position in every edited file:
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" inspired by http://vim.wikia.com/wiki/Example_vimrc
"
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" ^ set by archlinux.vim too

" turn on colors:
" Enable syntax highlighting
syntax on

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" make comments and other too dark colors show up as lighter:
set background=dark

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
" set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall


" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline
"""set modeline
" with securemodelines plugin:
" https://github.com/ciaranm/securemodelines/blob/master/plugin/securemodelines.vim
" let g:secure_modelines_allowed_items=["iskeyword", "isk" ]
let g:secure_modelines_allowed_items=[
\ "iskeyword", "isk",
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "cindent",     "cin",  "nocindent", "nocin",
                \ "smartindent", "si",   "nosmartindent", "nosi",
                \ "autoindent",  "ai",   "noautoindent", "noai",
                \ "spell",
                \ "spelllang"
                \ ]

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
" set ignorecase
" set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" ^ set by archlinux.vim too

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" ^ set by archlinux.vim too

" command line history:
set history=9999
" ^ set by archlinux.vim but to a different value
" apparently higher than 4 digits is error invalid value

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg,.obj,.lo
" ^ from archlinux.vim + added .obj and .lo from current gentoo value (eg: 'set suffixes?')

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif
" ^ from archlinux.vim

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm
" nope, nevermind that:
set noconfirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
" set t_vb=

" Enable use of the mouse for all modes
" set mouse=a
" set mouse=nv
" disable mouse:
set mouse=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
" set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
" uses spaces instead of tabs(then you can reindent with = key or gg=G for
" entire file):
set expandtab
" or use tabs instead of spaces for tabs:
" set noexpandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
" set shiftwidth=2
set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" when pasting, paste as it is (while in paste mode, F2 first or :set paste) instead of autoindent the pasted text ( :set nopaste  or press F2 again):
" set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" and also show the current mode


map :Q :q
map :WQ :wq
map :wQ :wq
map :Wq :wq
map :W :w

" -------------
"  fix urxvt Ctrl+Left and Ctrl+Right not acting like Shift+Left and
"  Shift+Right do, that is: move past words
" FIXME: this still doesn't fix the same keys in Insert mode!!!
if &term == "rxvt-unicode-256color"
    map <esc>Od <C-Left>
    map! <esc>Od <C-Left>
    map <esc>Oc <C-Right>
    map! <esc>Oc <C-Right>
endif

" auto set mark named s so you can use `s to go back to where you were before
" the search
nnoremap / ms/
nnoremap ? ms?
" src: https://stackoverflow.com/questions/53911/in-vim-how-do-i-go-back-to-where-i-was-before-a-search/10392263#10392263
" extras for # and *  searches! as follows:
" TODO: probably needs a timer, eg. if in the past 1 min you didn't set a
" mark then ask me to set mark or not for `s to get back to
" nnoremap #
" I guess it's too complicated to implement and would be bothersome, it's
" better to just REMEMBER to just type 'ms' in non-insert mode to set mark s
" and then go back to it with `s   after you're done doing lots of shift-3 and/or shift-8

"------------------------------------------------------------

" see CR and eol 'cause how else am I gonna quickly see when line begins/ends
" in logs :)
" set list
" ok don't see
set nolist
" to toggle: set list!
" use keys: \e
:nnoremap <Leader>e :set list!<CR>

" This causes vim to support only unix-style files natively. For non-Unix
" style line-endings, the carriage return character \r will be displayed
" explicitly in vim as ^M.
" src: https://superuser.com/questions/97692/vim-show-line-feeds-carriage-return
set fileformats=unix
" if you want display ^M (and others) in hex:
" set dy=uhex
" displayed color of things like ^M or if dy is set to uhex as above then <0d>
highlight SpecialKey ctermfg=5



" to display tabs as spaces instead of ^I or <09>:
" set listchars=eol:$,tab:\ \  " comment to prevent eol removal
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
highligh NonText ctermfg=6 guifg=gray
" src: https://stackoverflow.com/questions/903934/unable-to-make-gray-eol-character-by-vimrc/912543#912543

" highlight current line, src: http://vim.wikia.com/wiki/Highlight_current_line
" set cursorline
" and background:
" hi CursorLine   ctermbg=darkblue
" darkblue is 4
" set only background, still requires: set cursorline
set cursorline
" highlight CursorLine cterm=NONE ctermbg=darkblue
" ^ that is bad because can't see text that's blue already
" highlight CursorLine cterm=inverse ctermbg=none
" ^ this looks weird when you're on this ^ line with the cursor
highlight CursorLine cterm=bold
" this has no effect:
" highlight CursorColumn cterm=NONE ctermbg=darkred

" To highlight the current line, and have the highlighting stay where it is
" when the cursor is moved, use this mapping:
" press: \l
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" With the default backslash leader key, pressing \l will highlight the line that currently contains the cursor. The mapping also sets mark l so you can type 'l to return to the highlighted line. Enter :match to clear the highlighting when finished.

" make vim background transparent
highlight Normal ctermfg=250 ctermbg=none

" change comments color
" the 26 color works for urxvt which has a 256 color terminal
"highlight Comment ctermbg=none ctermfg=26
highlight Comment ctermbg=none ctermfg=darkgray
" 8 is darkgray

"To use the RustRun commands, you may need to insert this line in your ~/.vimrc:
filetype plugin on

" Now just press Ctrl+F on the function call to see its definition(s).
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>

" let g:NERDTreeWinSize = 60
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git

" http://vimdoc.sourceforge.net/htmldoc/recover.html#swap-file
" put .swp files in /tmp aka tmpfs aka ramdrive
" set directory=/tmp/vim
" ^ that folder must exist! currently .bashrc makes sure of this
" !mkdir --mode=700 --parents -- /tmp/vim/
" done: ok, I need vim to make .swp files with mode 600 always!
" XXX: do not use /tmp/vim/ because it's in tmpfs and sometimes system locks
" up due to video card driver failures(in linux/kernel) and we do need the
" .swp files to recover! ssd write count is not as important!

" http://vimdoc.sourceforge.net/htmldoc/options.html#%27maxmem%27
set maxmem=300000
set maxmemtot=2000000


" :set viminfo?   to see current value: viminfo='100,<50,s10,h
" First, the ' option is used to specify how many files for which you save marks (a-z).
" The f option controls whether global marks (A-Z and 0-9) are stored.  If
" this
" option is 0, none are stored.  If it is 1 or you do not specify an f option,
" the marks are stored.
" The < option controls how many lines are saved for each of the registers.
" By
" default, all the lines are saved.  If 0, nothing is saved.  To avoid adding
" thousands of lines to your viminfo file (which might never get used and
" makes
" starting Vim slower) you use a maximum of 500 lines:
"         h       disable 'hlsearch' highlighting when starting
" s = no idea
set viminfo='99999,f1,<500,s10,h

" Vim creates a mark each time you exit Vim.  The last one is '0.  The
" position that '0 pointed to is made '1.  And '1 is made to '2, and so forth.
" Mark '9 is lost.

"set foldmethod=syntax
" set foldmethod=marker
"set foldnestmax=1
"set foldlevel=0


" src: https://github.com/rust-lang/rust.vim/pull/76/files
" use -Zno-trans
let g:rustc_syntax_only = 0
" the following is inactive even tho it says active! see:
" https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
" ^ search for: g:syntastic_mode_map ^
"let g:syntastic_mode_map = {
" 		\ "mode": "active",
" 		\ "active_filetypes": [],
" 		\ "passive_filetypes": ["rust"] }

"when 1 it just isn't doing its job tho!
let g:rustfmt_autosave = 0
"see: https://github.com/rust-lang/rust.vim
let g:rust_fold = 1
let g:ftplugin_rust_source_path = $HOME.'/build/1nonpkgs/rust/rust/'
let g:rust_playpen_url = ''
let g:rust_shortener_url = ''


" only works after - so, not in .vimrc! ffs
" :CurrentLineWhitespaceOn

if $HOME != "/root"
  " workaround for vim-better-whitespace, src: https://github.com/ntpeters/vim-better-whitespace/issues/40#issuecomment-160100081
  autocmd VimEnter * DisableWhitespace
  autocmd VimEnter * EnableWhitespace
endif

" https://github.com/junegunn/fzf
"set rtp+=~/build/1nonpkgs/fzf

" src: https://github.com/racer-rust/vim-racer/blob/master/README.md
" settings for vim-racer

set hidden
"It hides buffers instead of closing them. This means that you can have
"unwritten changes to a file and open a new file using :e, without being
"forced to write or undo your changes first. Also, undo buffers and marks are
"preserved while the buffer is open.

"let g:racer_cmd = "/home/z/build/1nonpkgs/racer/target/release/racer"
"let $RUST_SRC_PATH="/home/z/build/1nonpkgs/rust/rust/src"

