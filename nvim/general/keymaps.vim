"#################"
"#    KEYMAPS    #"
"#################"


"##"Navigation"##"

"Main
let mapleader=","
inoremap jk <ESC>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

"Next/Prev Buffer
nnoremap  <silent>   <tab> :bnext<CR>
nnoremap  <silent> <s-tab> :bprevious<CR>

"Split Tabs
nnoremap <leader>x :sp<CR> <C-w>j<CR>
nnoremap <leader>s :vsp<CR> <C-w>l<CR>

"Open File Tree on Left
nmap <silent> <leader>n :call ToggleNERDTree()<CR>
function! ToggleNERDTree()
	NERDTreeToggle %
	silent NERDTreeMirror
endfunction

"Open Undo Tree on Left
nnoremap <leader>u :UndotreeToggle<CR> <C-w>h<CR>

"NERDCommenter
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

"Goyo
nnoremap <silent> <leader>d :Goyo<CR>

"Change colorscheme
map <silent> <leader>sg :execute (g:colors_name != "gruvbox" ? "colorscheme gruvbox" : "colorscheme simple-dark") <CR>
map <silent> <leader>sa :execute (g:colors_name != "atlas" ? "colorscheme atlas" : "colorscheme Atelier_EstuaryDark") <CR>
map <silent> <leader>sd :execute (g:colors_name != "warlock" ? "colorscheme warlock" : "colorscheme gruvbox") <CR>

"Disable Arrow Keys!
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>

"##############"
"# Not In Use #"
"##############"

"coc
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"nnoremap <leader>pp :CocCommand python.execInTerminal<CR>
"nnoremap <leader>pg :CocCommand go.playground<CR>

