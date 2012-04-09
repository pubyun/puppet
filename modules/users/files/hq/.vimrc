syntax on

set fileformat=unix
set encoding=utf-8
filetype indent on

set tabstop=8
set softtabstop=4
set shiftwidth=4

set background=dark

set tags=tags

set ai

set sw=4 sts=4 et

augroup vimrc
    au!
    autocmd FileType css setlocal sw=4 sts=4 et
    autocmd FileType eruby setlocal sw=2 sts=2 et
    autocmd FileType haskell setlocal sw=4 sts=4 et
    autocmd FileType htmlcheetah setlocal sw=2 sts=2 et
    autocmd FileType html setlocal sw=2 sts=2 et
    autocmd FileType javascript setlocal sw=2 sts=2 et
    autocmd FileType java setlocal sw=4 sts=4 et
    autocmd FileType mason setlocal sw=2 sts=2 et
    autocmd FileType ocaml setlocal sw=2 sts=2 et
    autocmd FileType perl setlocal sw=4 sts=4 et
    autocmd FileType php setlocal sw=4 sts=4 et
    autocmd FileType python setlocal sw=4 sts=4 et tw=72
    autocmd FileType ruby setlocal sw=2 sts=2 et
    autocmd FileType scheme setlocal sw=2 sts=2 et
    autocmd FileType sql setlocal et
    autocmd FileType text setlocal sw=2 sts=2 et tw=79
augroup END

