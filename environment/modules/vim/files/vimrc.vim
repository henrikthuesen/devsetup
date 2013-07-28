execute pathogen#infect()
syntax on
filetype plugin indent on

" OmniSharp:SuperTab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

" Omnisharp:settings
let g:OmniSharp_typeLookupInPreview = 1
set completeopt=longest,menuone,preview

" Omnisharp:keybindings
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap fi :OmniSharpFindImplementations<cr>
nnoremap fu :OmniSharpFindUsages<cr>
" Leader is default '\'
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
nnoremap <space> :OmniSharpGetCodeActions<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>


" Proper settings....
set tabstop=2
set shiftwidth=2
colorscheme molokai
set cursorline
set hlsearch " hightlight searches
set showbreak=@
set ignorecase
set infercase
set listchars=tab:▸\ ,eol:¬
" system(abs,
"        ghd, <-- Indentation
"        djd)
set cinoptions+=(0


set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
" Some wierd background stuff
set t_ut=

hi User1 ctermbg=darkblue ctermfg=white   guibg=green guifg=red
hi User2 ctermbg=red   ctermfg=white  guibg=red   guifg=blue
set statusline=%1*%t%*%m%-h%-r%-y\ buf\ %-n%=%2*LN\ %l/%L\ %-2c%*\ %p%%
set suffixes=.aux,.bak,.dvi,.idx,.log,.ps,.swp,.tar,.pdf,.a2s,.astL,~,.o
set wildignore=*.aux,*.bak,*.dvi,*.idx,*.log,*.ps,*.swp,*.tar,*.pdf,*.a2s,*.astL,*~,*.class,*.O

nmap o :FufFile<CR>
nmap O :FufJumpList<CR>
nmap e :FufBuffer<CR>
nmap w :bd<CR>
nmap zz :w<CR>
nmap ,e :set spelllang=en<CR>
nmap ,d :set spelllang=da<CR>
nmap ,S :set invspell<CR>
"for terminal use
nmap  :nohlsearch<CR>

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"
" Restore cursor to file position
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


