set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.




"-------------Visuals--------------"
colorscheme hybrid_material						"Hybrid Material Theme https://github.com/kristijanhusak/vim-hybrid-material
let g:enable_bold_font = 1						"Hybrid Material Theme functions,etc in bold

set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h15						"Set the default font family and size.
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
"Make it easy to edit the plugins.vim file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>




"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:10'
let g:ctrlp_extension = ['buffertag']

"/
"/ vim-airline
"/
set laststatus=2
let g:airline_theme = "hybrid"						"Hybrid Material Theme for vim-airline
let g:airline_powerline_fonts = 1




"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost ~/.vimrc source %
	autocmd BufWritePost ~/.vim/plugins.vim source %
augroup END
