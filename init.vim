set nocompatible               " be iMproved
filetype off                   " required!
set number
set relativenumber

if has('vim_starting')
  " Required:
  set runtimepath+=/Users/cheerfulstoic/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('/Users/cheerfulstoic/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

syntax on

" My Bundles here:
"
" original repos on github
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ctrlpvim/ctrlp.vim'
" NeoBundle 'wikitopian/hardmode'
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'demands/vim-coffee-script'
" NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'flazz/vim-colorschemes'
" NeoBundle 'ervandew/supertab'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'vim-scripts/projectroot'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'lilydjwg/colorizer'
" NeoBundle 'neo4j-contrib/cypher-vim-syntax'
" NeoBundle 'vim-sexp'
" NeoBundle 'bling/vim-airline'
" NeoBundle 'heartsentwined/vim-emblem'
" NeoBundle 'asciidoc/vim-asciidoc'
" NeoBundle 'hwartig/vim-seeing-is-believing'
" NeoBundle 'powerman/vim-plugin-AnsiEsc'
" NeoBundle 'itspriddle/vim-marked'
NeoBundle 'vim-ruby/vim-ruby'
" NeoBundle 'vim-utils/vim-ruby-fold'
" NeoBundle 'Floobits/floobits-vim'
" NeoBundle 'janko-m/vim-test'
" NeoBundle 'christoomey/vim-tmux-runner'
" NeoBundle 'tpope/vim-jdaddy'
" NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'justinmk/vim-sneak'
" NeoBundle 'tpope/vim-dadbod'
" NeoBundle 'prabirshrestha/async.vim'
" NeoBundle 'prabirshrestha/vim-lsp'
NeoBundle 'posva/vim-vue'
NeoBundle 'vim-scripts/RltvNmbr.vim'
" NeoBundle 'slashmili/alchemist.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'srcery-colors/srcery-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'mcchrish/nnn.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'neoclide/coc.nvim', {'rev': 'release'}


call neobundle#end()
" call vundle#end()

NeoBundleCheck

filetype plugin indent on

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus', 'syntastic' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'FilenameForLightline',
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ }
      \ }

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

" START CoC configuration
" Copied from https://github.com/neoclide/coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" END CoC configuration

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:lightline.enable = { 'tabline': 0 }

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
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

set laststatus=2

set ttyfast
set lazyredraw
"set re=1

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    au BufNewFile,BufRead *.go set nolist
    set list

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" colorscheme abra
colorscheme srcery


filetype plugin indent on     " required!

set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=10

set suffixesadd+=.coffee

" use ag as search program
setglobal grepprg=ag

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_show_hidden=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

set rtp+=/usr/local/opt/fzf

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -i --files-with-matches --nocolor --hidden --nogroup  -g "" --ignore .git --ignore "*.rbi" --ignore "./docs/api"'

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

" To allow changes to be seen via Docker volume mappings
set backupcopy=yes

function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  " echo msg
  let @"=reg_saved
endfunction

autocmd BufNewFile,BufRead *.vue   set ft=vue
autocmd FileType vue syntax sync fromstart

command! W write

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)

let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

let g:graphql_javascript_tags = []

" for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
"

" if executable('solargraph')
"     " gem install solargraph
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'solargraph',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"         \ 'initialization_options': {"diagnostics": "true"},
"         \ 'whitelist': ['ruby'],
"         \ })
"
"   nnoremap <silent> <Leader>dd :LspDefinition<cr>
"   nnoremap <silent> <Leader>ds :LspDocumentSymbol<cr>
"   nnoremap <silent> <Leader>dr :LspReferences<cr>
"   " autocmd FileType ruby setlocal omnifunc=lsp#complete
"
" endif

nnoremap <silent> [q :cprev<cr>
nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [Q :cfirst<cr>
nnoremap <silent> ]Q :clast<cr>

" https://vim.fandom.com/wiki/Avoid_the_escape_key
nnoremap <C-@> i
imap <C-@> <Esc>

set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

let g:nnn#set_default_mappings = 0
let g:nnn#command = 'nnn -dH'
command! Exp NnnPicker '%:p:h'
command! Explore NnnPicker '%:p:h'

nnoremap <Leader>n :set relativenumber!<cr>
nnoremap <Leader>p :set paste!<cr>

" Keep at end of this file
set exrc
set secure
