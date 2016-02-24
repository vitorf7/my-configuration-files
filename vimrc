set nocompatible              						    "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
filetype indent on
set backspace=indent,eol,start                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	    "The default is \, but a comma is much better.
set relativenumber                                      "Activate relative numbers (current line is 0)
set number								                "Let's activate line numbers.
"Setting relative number and number in vim 7.4 will create an hybrid which
"will show the absolute line number for the current line and then the relative
"numbers of the lines above and below
set autoread                                            "Make sure that Vim auto reads files, especially useful when updating files becuase of git
set noerrorbells visualbell t_vb=                       "No bells


"-------------Visuals--------------"
colorscheme hybrid_material					            "Hybrid Material Theme https://github.com/kristijanhusak/vim-hybrid-material
let g:enable_bold_font = 1					            "Hybrid Material Theme functions,etc in bold

set t_CO=256								            "Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h15					            "Set the default font family and size.
set macligatures							            "We want pretty symbols, when available
set guioptions-=e							            "We don't want gui tabs
set linespace=15   						                "Macvim-specific line-height.

set guioptions-=l                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

set tabstop     =4   						            "tabstop:          Width of tab character
set softtabstop =4							            "softtabstop:      Fine tunes the amount of white space to be added
set shiftwidth  =4							            "shiftwidth        Determines the amount of whitespace to add in normal mode
set expandtab								            "expandtab:        When on uses space instead of tabs
if exists('+colorcolumn')
set colorcolumn=80,120                                  "Set column width 80 characters
endif

"Tab Line bg to match bg of Theme
hi TabLine guifg=bg guibg=white
hi TabLineFill guifg=bg

"-------------Search--------------"
set hlsearch								            "Highlight all matched terms.
set incsearch								            "Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 								            "Make splits default to below...
set splitright								            "And to the right. This feels more natural.

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
"Make it easy to edit the aliases file
nmap <Leader>ea :tabedit ~/.aliases<cr>
"Make it easy to edit any snippets file
nmap <Leader>es :tabedit ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Mapping to look for a tag using ctags
nmap <Leader>f :tag<space>
nmap <Leader>rt :!ctags -R --exclude=node_modules

"Add a file and edit
nmap <Leader>n :e<space>
"Add a file and edit in a new tab
nmap <Leader>t :tabedit<space>

"Mapp jj to exit out like esc
imap jj <ESC>

"Make it easier to close an HTML Tag
:imap <C-Space> <C-X><C-O>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"-------------Laravel Mappings--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lmk :!php artisan make:
nmap <Leader>la :! php artisan 


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
let g:airline_theme = "hybrid"						        "Hybrid Material Theme for vim-airline
let g:airline_powerline_fonts = 1

"/
"/ NERDTree
"/
let NERDTreeShowHidden = 1						            "Show hidden files on NERDTree
let NERDTreeQiutOnOpen = 1						            "Quit NERDTree when you open a file
let NERDTreeHijackNetrw = 0
"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>



"/
"/ NERD Commenter
"/
"Re-map the toggle comment of NERD commenter
nmap <D-/> <Leader>c<space>

"/
"/ Vim PHP Namespace
"/
"Use Statetemnts at the top of the file
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
"Expand fully qualified namespace
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"/
"/ Vim PHP CS Fixer
"/
let g:php_cs_fixer_level = "psr2"                           " which level ?
"let g:php_cs_fixer_verbose = 0                             " Return the output of command if 1, else an inline information.
autocmd FileType php nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
autocmd FileType php nnoremap <silent><C-b> :call PhpCsFixerFixFile()<CR><CR>

"/
"/ Emmet Vim
"/
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <expr> <Leader><tab> emmet#expandAbbrIntelligent("\<tab>")


"/ 
"/ Greplace
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'


"/
"/ Vim PHP QA
"/
" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=psr2"
" PHP executable (default = "php")
let g:phpqa_php_cmd='/usr/local/bin/php'
" PHP Code Sniffer binary (default = "phpcs")
let g:phpqa_codesniffer_cmd='/Users/vitorfaiante/.composer/vendor/bin/phpcs'
" PHP Mess Detector binary (default = "phpmd")
let g:phpqa_messdetector_cmd='/Users/vitorfaiante/.composer/vendor/bin/phpmd'
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Stop the location list opening automatically
let g:phpqa_open_loc = 0

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost ~/.vimrc source %
	autocmd BufWritePost ~/.gvimrc source %
	autocmd BufWritePost ~/.vim/plugins.vim source %
augroup END

"Automatically csscomb scss files (needs to have csscomb installed in the
"computer)
augroup autocsscomb
	autocmd!
	autocmd BufWritePost *.scss :silent !csscomb %
augroup END

" Override PHP syntax hilighting in comments
" https://github.com/StanAngeloff/php.vim
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located
