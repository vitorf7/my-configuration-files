set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
filetype indent on
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.




"-------------Visuals--------------"
colorscheme hybrid_material						"Hybrid Material Theme https://github.com/kristijanhusak/vim-hybrid-material
let g:enable_bold_font = 1						"Hybrid Material Theme functions,etc in bold

set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h15						"Set the default font family and size.
set macligatures							"We want pretty symbols, when available
set guioptions-=e							"We don't want gui tabs
set linespace=15   						        "Macvim-specific line-height.

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R




"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit ~/.vimrc<cr>
"Make it easy to edit the Gvimrc file
nmap <Leader>eg :tabedit ~/.gvimrc<cr>
"Make it easy to edit the plugins.vim file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Mapping to look for a tag using ctags
nmap <Leader>f :tag<space>
nmap <Leader>rt :!ctags -R --exclude=node_modules

"Add a file and edit
nmap <Leader>n :e<space>
"Add a file and edit in a new tab
nmap <Leader>t :tabedit<space>


"-------------Plugins + Mappings--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:10'
let g:ctrlp_extension = ['buffertag']
let g:ctrlp_show_hidden = 1
"Open a file (remap the CtrlP to CMD + P like in sublime)
nmap <D-p> :CtrlP<cr>
"Search for methods
nmap <D-r> :CtrlPBufTag<cr>
"Look at the most recently used files
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/ vim-airline
"/
set laststatus=2
let g:airline_theme = "hybrid"						"Hybrid Material Theme for vim-airline
let g:airline_powerline_fonts = 1

"/
"/ NERDTree
"/
let NERDTreeShowHidden = 1						"Show hidden files on NERDTree
let NERDTreeQiutOnOpen = 1						"Quit NERDTree when you open a file
let NERDTreeHijackNetrw = 0
"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>

"/
"/ Vim PHP Namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"/
"/ Vim PHP CS Fixer
"/
let g:php_cs_fixer_level = "psr2"              " which level ?
"let g:php_cs_fixer_verbose = 0                 " Return the output of command if 1, else an inline information.
autocmd FileType php nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
autocmd FileType php nnoremap <silent><C-b> :call PhpCsFixerFixFile()<CR><CR>

"/
"/ Emmet Vim
"/
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")



"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost ~/.vimrc source %
	autocmd BufWritePost ~/.gvimrc source %
	autocmd BufWritePost ~/.vim/plugins.vim source %
augroup END

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located
