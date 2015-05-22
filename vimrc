" Enable plugin management
execute pathogen#infect()
execute pathogen#helptags()

" Enable 256 colors
set t_Co=256

" Enable syntax highlighting
syntax on

" Detect filetype's and use python.vim plugin
filetype plugin indent on

" Switch to dark solarized theme
set background=dark
colorscheme solarized

" Font in gvim
if has('gui_running')
    set guifont=Inconsolata\ Bold\ 12
endif

" Configure airline
set laststatus=2

" Enable incremental search
set incsearch

" Map F5 to gundo
nnoremap <F5> :GundoToggle<CR>

" Some map's for numbers
set number
nnoremap <silent> <F2> :NumbersToggle<CR>
inoremap <C-c> <Esc><Esc>

" Enable modeline
set modeline
