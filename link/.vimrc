" show line numbers
set number

" one tab is equals four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" highlight search results
set hlsearch

" search as you type
set incsearch

" case insensitive search
set ignorecase

" enable syntax highlighting
syntax on

set background=dark

nnoremap <F2> :NERDTree<CR>
nnoremap <F1> <C-W><C-W>
nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>

" vim pathogen
execute pathogen#infect()







function RemoveTrailingWhitespace()
    if !&binary
        normal! mz
        %s/\s\+$//ge
        normal! 'z
    endif
endfunction
autocmd BufWritePre * :call RemoveTrailingWhitespace()
