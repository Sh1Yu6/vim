let mapleader = " "
set number
let &t_ut=''
"set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2    
\ set softtabstop=2
\ set shiftwidth=2
set expandtab
set autoindent
set cursorline
set wrap        
set showcmd
set wildmenu 
set ignorecase
set smartcase
set showmatch
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set laststatus=2
set autochdir
set scrolloff=5
"set splitbelow
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"F5编译
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
  endif
endfunc    

" 退出 方向键映射
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
noremap h i
noremap i k
noremap k j
noremap j h
noremap I 5k
"noremap K 5j
noremap H I
noremap <LEADER>z :nohlsearch<CR>

" 开新窗口
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>

" 窗口位置变换
map sv <C-w>t<C-w>H
map sh <C-w>t<c-w>K
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

" 调整窗口大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 拼写检查 新开窗口
map sc :set spell!<CR>  
map tk :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>


map ff :NERDTreeToggle<CR>

"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "N"
"let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
"let NERDTreeMapOpenVSplit = "H"
"let NERDTreeMapActivateNode = "h"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapOpenInTabSilent = "O"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = ""
"let NERDTreeMapChangeRoot = "l"
"let NERDTreeMapMenu = ","
"let NERDTreeMapToggleHidden = "zh"

let g:tagbar_map_toggleinsensisort = ""  


map <F3> :Neoformat<CR>

map gd <leader>d
map gr <leader>r
map gs <leader>n
map gk K


map <F4> :Neomake<CR>



call plug#begin('~/.config/nvim/plugged')
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'

Plug 'Yggdroot/indentLine'                                                                                                      
Plug 'junegunn/fzf.vim'    
Plug 'junegunn/fzf'  
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
call plug#end()

let g:SimpylFold_docstring_preview=1
let g:deoplete#enable_at_startup = 1

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"let g:airline_theme='dark theme with a regular font'


let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right""

let g:neomake_python_enabled_makers = ['pylint']

colorscheme gruvbox
set background=dark

set t_Co=256
let NERDTreeShowHidden=1

let g:indentLine_char = '│'    
let g:indentLine_color_term = 238    
let g:indentLine_color_gui = '#333333'    
    
map <C-p> :FZF<CR>   


nmap <F8> :TagbarToggle<CR> 




autocmd BufNewFile *.php,*.js,*.py exec ":call SetCommentT()" |normal 10Go

func! SetCommentT()

    if expand("%:e") == 'py'
        call setline(1,"#python")
        call append(1, '#***********************************************')
        call append(2, '#')
        call append(3, '#      Filename: '.expand("%"))
        call append(4, '#')
        call append(5, '#        Author: Sh1Yu6')
        call append(6, '#   Description: ---')
        call append(7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(9, '#***********************************************')
        
    endif


endfunc

autocmd BufNewFile *.cpp exec ":call SetCommentCPP()"|normal 18Go

func! SetCommentCPP()
    
    if expand("%:e") == 'cpp'
        call append(1, '/************************************************')
        call append(2, '#')
        call append(3, '#      Filename: '.expand("%"))
        call append(4, '#')
        call append(5, '#        Author: Sh1Yu6')
        call append(6, '#   Description: ---')
        call append(7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(9, '#***********************************************/')
        call append(10,'#include <iostream>')
        call append(11,'#include <string>')
        call append(12,'#include <vector>')
        call append(13,'#include <algorithm>')
        call append(14,'#include <cmath>')
        call append(15,'#include <stdexcept>')
        call append(16,'int main(int argc, char *argv[])')
        call append(17,'{')
        call append(18,'    return 0;')
        call append(19,'}')
    endif
endfunc


map <F2> :call SetCommentT()<CR>:10<CR>o

func! DataInsertT()

    call cursor(9,1)
    if search ('Last Modified') != 0
        let line = line('.')
        call setline(line, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc

autocmd FileWritePre,BufWritePre *.php,*.js,*.cpp,*py ks|call DataInsertT() |'s





 


