call plug#begin('~/.vim/plugged')
  Plug 'mattn/emmet-vim'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-fugitive'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'myusuf3/numbers.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dag/vim2hs'
	Plug 'freitass/todo.txt-vim'
  Plug 'tmux-plugins/vim-tmux-focus-events'
call plug#end()

" Generel Settings
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap { {<CR><BS>}<Esc>ko
set expandtab
set autoindent
set smarttab
set smartindent
set hlsearch
set pastetoggle=<F11>
set tabstop=2
set softtabstop=2
set shiftwidth=2
set confirm
ino jk <Esc>
ino kj <Esc>
set colorcolumn=80
set cmdheight=2

" Autoread file changes
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
	\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Emmet Config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Tagalong Config
let g:tagalong_verbose = 1

" NERDTree Config
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeLimitedSyntax = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" NERDTree Git Config
let g:NERDTreeGitStatusShowIgnored = 1

" ctrlP Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-startify Config
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Startify | endif

" Handling highlighting in large buffers
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" COC config
let g:coc_global_extensions = [
	\ 'coc-tsserver'
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

" Custom Keymaps
map <F2> :NERDTreeFocus<CR>

