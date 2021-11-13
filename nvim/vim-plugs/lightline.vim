" LIGHTLINE SETTINGS

let g:lightline = {
	\ 'colorscheme': 'PaperColor'
  \ }

"let g:lightline = {
"	\ 'colorscheme': 'atlas'
"  \ }

let g:lightline.tabline = {
	\ 'left': [['buffers']],
	\ 'right': [[]]
  \ }
let g:lightline.component_expand = {
	\ 'buffers': 'lightline#bufferline#buffers'
  \ }
let g:lightline.component_type = {
	\ 'buffers': 'tabsel'
  \ }
let g:lightline#bufferline#show_number = 1
let g:lightline.component = {
	\ 'filename': '%n:%t'
  \ }
let g:lightline.active = {
	\ 'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']]
  \ }
let g:lightline.component_function = {
	\ 'gitbranch': 'FugitiveHead'
  \ }
