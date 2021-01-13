set nocompatible
filetype off

set visualbell

filetype plugin on

function! SetupCustomMappings()
    let g:mapleader = " "

    " highlight without moving to the next match
    nnoremap <silent> # :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>- :vertical resize -10<CR>
    nnoremap <Leader>+ :vertical resize +10<CR>
    nnoremap <Leader>_ :resize -10<CR>
    nnoremap <Leader>* :resize +10<CR>
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
    set backspace=indent,eol,start
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

function! AddCustomMatches()
    let b:custom_matches = []

    " highlight trailing spaces
    call add(b:custom_matches, matchadd("ExtraWhitespace", "\\s\\+$"))

    " highlight tabs
    call add(b:custom_matches, matchadd("ExtraWhitespace", "\\t"))
endfunction

function! DeleteCustomMatchces()
    if !exists("b:custom_matches")
        return
    endif

    for m in b:custom_matches
        call matchdelete(m)
    endfor

    unlet b:custom_matches
endfunction

function! SetupCustomMatches()
    highlight ExtraWhitespace ctermbg=red guibg=red

    augroup CustomMatches
        autocmd!
        autocmd BufWinEnter * call AddCustomMatches()
        autocmd BufWinLeave * call DeleteCustomMatchces()
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
    autocmd!
    autocmd BufWritePre * :call RemoveTrailingWhitespace()
    autocmd BufWritePre * :retab
augroup END

let g:debug_matching_counterpart=1
au BufNewFile,BufRead *.gradle set filetype=groovy
