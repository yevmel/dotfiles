set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-expand-region'

call vundle#end()
filetype plugin on

function SetupCustomMappings()
    let g:mapleader = " "

    nnoremap <Leader>w :w<CR>
    nnoremap <F2> :NERDTree<CR>
    nnoremap <F1> <C-W><C-W>
    nnoremap - :vertical resize -5<CR>
    nnoremap + :vertical resize +5<CR>

    xnoremap <TAB> >gv
    xnoremap <S-TAB> <gv
endfunction
call SetupCustomMappings()

function SetupCustomSettings()
    set number
    set laststatus=2
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set hlsearch
    set incsearch
    set ignorecase
    set background=dark
    set diffopt+=vertical
    syntax on
endfunction
call SetupCustomSettings()

function SetupPluginAirline()
    let g:airline_right_sep=''
    let g:airline_left_sep=''
    let g:airline#extensions#whitespace#enabled=0
endfunction
call SetupPluginAirline()

function SetupCustomMatches()
    highlight ExtraWhitespace ctermbg=red guibg=red

    " highlight trailing spaces
    autocmd BufWinEnter * call matchadd("ExtraWhitespace", "\\s\\+$")

    " highlight tabs
    autocmd BufWinEnter * call matchadd("ExtraWhitespace", "\\t")

    " clear matches when leavin a buffer... they will be reinitialized next time you open a buffer
    autocmd BufWinLeave * call clearmatches()
endfunction
call SetupCustomMatches()


function RemoveTrailingWhitespace()
    if !&binary
        normal! mz
        %s/\s\+$//ge
        normal! 'z
    endif
endfunction

autocmd BufWritePre * :call RemoveTrailingWhitespace()
autocmd BufWritePre * :retab
