filetype off                  " required

"Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin '2072/vim-syntax-for-PHP.git'
Plugin 'sheerun/vim-polyglot'
Plugin 'jwalton512/vim-blade'
Plugin 'mattn/emmet-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
