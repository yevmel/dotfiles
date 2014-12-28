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

function! SetupCustomMappings()
    let g:mapleader = " "

    " highlight without moving to the next match
    nnoremap # :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>- :vertical resize -10<CR>
    nnoremap <Leader>+ :vertical resize +10<CR>
    nnoremap <Leader>so :so %<CR>

    nnoremap <F2> :NERDTree<CR>
    nnoremap <F1> <C-W><C-W>

    xnoremap <TAB> >gv
    xnoremap <S-TAB> <gv
endfunction
call SetupCustomMappings()

function! SetupCustomSettings()
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

function! SetupPluginAirline()
    let g:airline_right_sep=''
    let g:airline_left_sep=''
    let g:airline_branch_prefix='⎇'
    let g:airline#extensions#whitespace#enabled=0
endfunction
call SetupPluginAirline()

function! SetupCustomMatches()
    highlight ExtraWhitespace ctermbg=red guibg=red

    augroup CustomMatches
        " highlight trailing spaces
        autocmd BufWinEnter * call matchadd("ExtraWhitespace", "\\s\\+$")

        " highlight tabs
        autocmd BufWinEnter * call matchadd("ExtraWhitespace", "\\t")

        " clear matches when leavin a buffer... they will be reinitialized next time you open a buffer
        autocmd BufWinLeave * call clearmatches()
    augroup END
endfunction
call SetupCustomMatches()


function! RemoveTrailingWhitespace()
    if !&binary
        normal! mz
        %s/\s\+$//ge
        normal! 'z
    endif
endfunction

augroup SaveActions
    autocmd BufWritePre * :call RemoveTrailingWhitespace()
    autocmd BufWritePre * :retab
augroup END
