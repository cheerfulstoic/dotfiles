set nocompatible               " be iMproved
filetype off                   " required!
set number

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'wikitopian/hardmode'
" Bundle 'kchmck/vim-coffee-script'
Bundle 'demands/vim-coffee-script'
Bundle 'slim-template/vim-slim.git'
Bundle 'flazz/vim-colorschemes'
Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/projectroot'
Bundle 'AndrewRadev/splitjoin.vim'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/syntastic'

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

colorscheme herald

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

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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

function! SetOpenFile()
  silent execute "!echo '%' >> " . ProjectRootGuess() . "/.open_files.vim"
endfunction

function! UnsetOpenFile()
  silent execute "!grep -v '%' " . ProjectRootGuess() . "/.open_files.vim | sort | uniq > " . ProjectRootGuess() . "/.open_files.vim"
endfunction

"autocmd BufWinEnter * 
autocmd BufWinEnter * :call SetOpenFile()


autocmd BufWinLeave * :call UnsetOpenFile()

" I don't know what that sed does either.  Got it here:
" http://sed.sourceforge.net/sedfaq4.html#s4.11
" autocmd BufWinLeave * :!sed -i '' '\!%:p!{x;/Y/!{s/^/Y/;h;d;};x;}' ~/.open_files.vim

highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/

" Coffeescript -------------- {{{2
augroup filetype_coffee
  autocmd!
  autocmd FileType coffee nnoremap <buffer> <leader>c :CoffeeCompile<CR>
  autocmd FileType coffee vnoremap <buffer> <leader>c :CoffeeCompile<CR>
  autocmd FileType coffee setlocal foldlevel=99

  autocmd BufWinEnter *.coffee match ExtraWhitespace /\s\+$/
  autocmd InsertEnter *.coffee match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave *.coffee match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave *.coffee call clearmatches()
  autocmd BufWritePre *.coffee :%s/\s\+$//e
augroup END

