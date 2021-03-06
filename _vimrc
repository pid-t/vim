set nocompatible
let mapleader = ','
set backspace=indent,eol,start
syntax enable
let g:iswindows = 0
let g:islinux = 0

if has("gui_running")
    let g:isGUI = 1
else 
    let g:isGUI = 0
endif

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if g:isGUI
    " au GUIEnter * simalt ~x       
    winpos 100 10
    set lines=38 columns=120
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif

" set the runtime path to include Vundle and initialize
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    set lines=999 columns=999
    au GUIEnter * simalt ~x
    set guifont=Consolas:h11:cANSI
endif

set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
let g:tagbar_ctags_bin = '~/.vim/plugins/ctags58/ctags.exe'

filetype off                  " required
call vundle#begin(path)

" ============ Plugins ============
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'Shougo/neocomplete'
Plugin 'fatih/vim-go'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
" ============== Plugins End ==============

behave mswin
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

set smarttab
set smartindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,latin-1
set fileformat=unix
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set writebackup                                       "保存文件前建立备份，保存成功后删除该备份
set nobackup
set noswapfile
set smarttab
set foldenable                                        "启用折叠
set foldmethod=manual
set laststatus=2
set list                                              " 显示tab和空格
set lcs=tab:\|\ ,nbsp:%,trail:.                       " 设置tab和空格样式
set autoread                                          " 当文件在外部被修改，自动更新该文件
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set background=dark
colorscheme railscasts                                " 颜色主题
"colorscheme solarized
highlight LeaderTab guifg=#666666                     " 设定行首tab为灰色
match LeaderTab /^\t/                                 " 匹配行首tab

" ============== Encoding ==============
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
if has("gui_running")
  " 中文菜单
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
endif

" ============== Plugin Settings ==============
" ===> neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" ===> vim-javascript-syntax
au FileType javascript call JavaScriptFold()

" ===> Emmet Vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" ===> ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
if g:iswindows
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.tar.gz,*.tar.bz2,*.tar.bz
else
 set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.bin
endif

" ===> go-vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" ===> NERDTree
map    <F3>        :NERDTreeToggle<CR>
imap   <F3> <ESC>  :NERDTreeToggle<CR>
map    <C-F3>      \be

" ============== Plugin Settings Ends ==============

" ============== Key Bind ==============
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>      " 用空格键来开关折叠
nmap cS :%s/\s\+$//g<CR>:noh<CR>                                        " 常规模式下输入 cS 清除行尾空格
nmap cM :%s/\r$//g<CR>:noh<CR>                                          " 常规模式下输入 cM 清除行尾 ^M 符号
nmap <F8> :TagbarToggle<CR>
" ============== Key Bind ==============

" ============== Tabstop settings ==============
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType php set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab
