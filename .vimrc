syntax on
set background=dark
"colorscheme somescheme 

set nocp  " don't know what is it, but omni use it see :h omnicppcomplete

" try to detect filetypes
filetype on                          
filetype plugin on
filetype indent on

" to make cursor underline


" It make mouse copping operation unavaliable
" use <shift> mouse to do selection
set mouse=a

" Set the default file encoding to UTF-8: 
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,latin1

" quick search
" use # or *

" ignore case
" ignorecase
" :set ic
" smartcase
" :set scs
" /\croot to find root with case ignored

"Toggle auto-indenting for code paste
" Start insert mode.
" Press F2 (toggles the 'paste' option on).
" Use your terminal to paste text from the clipboard.
" Press F2 (toggles the 'paste' option off). 
set pastetoggle=<F2>

" http://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
nnoremap <C-S-c> "+y
vnoremap <C-S-c> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" miniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplSplitBelow = 0
map <Leader>c :MiniBufExplorer<cr>
map <C-d> :bp<cr>
map <C-f> :bn<cr>

" tasklist
map T :TaskList<cr>

" taglist
" let Tlist_Ctags_Cmd = '/home/yuankui/ctags/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
map P :TlistToggle<cr>

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp

" omnifuc
" Ctrl+x Ctrl+o
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" winManager
let g:winManagerWindowLayout = 'FileExplorer|TagList'
nmap wv :WMToggle<cr>

" autocorrect
:source ~/.vim/autocorrect/autocorrect.vim

" ctag
map <leader>ctags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . -I<cr>
map <leader>ptags :!ctags -R .<cr>

" code fold
" use 'za'
set foldmethod=indent
set foldlevel=99

" 'ff' 'zfit' and 'af up down'
let g:FoldMethod = 1
map <leader>ff :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
	exe 'set foldmethod=indent'
	    let g:FoldMethod = 1
    else
	exe 'set foldmethod=marker'
	    let g:FoldMethod = 0
    endif
endfun

" pyflake
let g:pyflakes_use_quickfix = 1

" Turn on line numbers:
set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<cr>:set foldcolumn=0<cr>

" pydoc
" use '\pw'
let g:pydoc_cmd = "/usr/bin/pydoc"
"let g:pydoc_highlight=0

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=2
nmap <leader>sign :sign<cr>
nmap <leader>erros :Errors<cr>

" grep
" nnoremap <silent><F3> :Rgrep <cword><cr> 
nnoremap <silent><F3> :Rgrep<cr> 

" recreate tags file with F5
nnoremap <silent><F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<cr>

" build using makeprg with <F7>
nnoremap <silent><F7> :make<cr>
" build using makeprg with <S-F7>
nnoremap <silent><S-F7> :make clean all<cr>
" goto definition with F12
nnoremap <silent><F12> <C-]>
" nnoremap <silent><F12> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Highlight all search pattern matches
set hlsearch
" nohlsearch

" html indent
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zeroa"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"

" file switch
" :A switches to the header file corresponding to the current file being edited (or vise versa) 
" :AS splits and switches 
" :AV vertical splits and switches 
" :AT new tab and switches 
" :AN cycles through matches 
" :IH switches to file under cursor 
" :IHS splits and switches 
" :IHV vertical splits and switches 
" :IHT new tab and switches 
" :IHN cycles through matches 
" <Leader>ih switches to file under cursor 
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp) 
" <Leader>ihn cycles through matches 
nmap ea :A<cr>
nmap eav :AV<cr>
nmap eas :AS<cr>

" try ff  awesome!!!!!

" code navigation
" gD to locale ctrl+o to back
" ctrl+] to tag ctrl+t to back

" Set tabstop to tell vim how many columns a tab counts for. Linux kernel code
" expects each tab to be eight columns wide. Visual Studio expects each tab to
" be four columns wide. This is the only command here that will affect how
" existing text displays. 
set tabstop=4
" Set shiftwidth to control how many columns text is indented with the reindent
" operations (<< and >>) and automatic C-style indentation. 
set shiftwidth=4
" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is less than tabstop and expandtab is not set,
" vim will use a combination of tabs and spaces to make up the desired
" spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab is set, vim will always use the appropriate
" number of spaces. 
set softtabstop=4
set expandtab
" set noexpandtab

" gq to reformat such lines. 
" set tw=79

" Execute file being edited with <Shift> + e:
" map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" csupport plugin
" http://lug.fh-swf.de/vim/vim-doc/csupport.html
