set nocompatible               " be iMproved
filetype off                   " required!
set number
set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax on

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'wikitopian/hardmode'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'demands/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'vim-scripts/projectroot'
Plugin 'AndrewRadev/splitjoin.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'lilydjwg/colorizer'
Plugin 'neo4j-contrib/cypher-vim-syntax'
" Plugin 'vim-sexp'
" Plugin 'bling/vim-airline'
Plugin 'heartsentwined/vim-emblem'
Plugin 'asciidoc/vim-asciidoc'
" Plugin 'hwartig/vim-seeing-is-believing'
" Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'tpope/vim-cucumber'
" Plugin 'itspriddle/vim-marked'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'Floobits/floobits-vim'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-jdaddy'
Plugin 'sheerun/vim-polyglot'
Plugin 'elixir-lang/vim-elixir'
Plugin 'justinmk/vim-sneak'
Plugin 'ngmy/vim-rubocop'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-db'
call vundle#end()

" autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" autocmd FileType ruby xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
 
" autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
 
" autocmd FileType ruby nmap <buffer> <F6> <Plug>(seeing_is_believing-clean)
" autocmd FileType ruby xmap <buffer> <F6> <Plug>(seeing_is_believing-clean)
" autocmd FileType ruby imap <buffer> <F6> <Plug>(seeing_is_believing-clean)

autocmd BufNewFile,BufRead *.adoc set syntax=asciidoc
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir

set laststatus=2

set ttyfast
set lazyredraw
"set re=1

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list

filetype plugin indent on

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

colorscheme abra

filetype plugin indent on     " required!

set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

set suffixesadd+=.coffee

" use ag as search program
setglobal grepprg=ag

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" let g:ctrlp_show_hidden=1

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -i --files-with-matches --nocolor --hidden --nogroup  -g "" --ignore "./docs/api"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#282828   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2F2F2F   ctermbg=4

nnoremap Q <nop>

nnoremap <S-Up> :cprevious<CR>
nnoremap <S-Down> :cnext<CR>

set noswapfile

highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/

" All
nnoremap <Leader>taf :TestFile<CR>
nnoremap <Leader>tas :TestSuite<CR>
" Fast
nnoremap <Leader>tff :TestFile --fail-fast -fd<CR>
nnoremap <Leader>tfs :TestSuite --fail-fast -fd<CR>
" Nearest
nnoremap <Leader>tn :TestNearest -fd<CR>
" Last
nnoremap <Leader>tl :TestLast<CR>

if has("gui_macvim")
  set transparency=2

  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>

  let test#strategy = "iterm"
else
  let test#strategy = "vtr"
  set mouse=a
  vmap <C-c> "+y
endif


nnoremap <S-Up> :resize -5<CR>
nnoremap <S-Down> :resize +5<CR>
nnoremap <S-Left> :vertical resize -5<CR>
nnoremap <S-Right> :vertical resize +5<CR>

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

hi TabLineFill ctermfg=White ctermbg=White
hi TabLine ctermfg=Black ctermbg=White
hi TabLineSel ctermfg=White ctermbg=Black


highlight OverLength ctermbg=red ctermfg=white guibg=#592929


set exrc
set secure

let g:sneak#label = 1

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
