"FZF config
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

map <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'  }}

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

hi! fzf_fg ctermfg=14                                                                                                                                                       
hi! fzf_fgp ctermfg=3                                                                                                                                                       
hi! fzf_hl ctermfg=5                                                                                                                                                        
hi! fzf_hlp ctermfg=5                                                                                                                                                       
hi! fzf_info ctermfg=6                                                                                                                                                     
hi! fzf_prompt ctermfg=6                                                                                                                                                    
hi! fzf_spinner ctermfg=6                                                                                                                                                   
hi! fzf_pointer ctermfg=3 

let g:fzf_colors = {                                                                                                                                                        
  \ 'fg':      ['fg', 'fzf_fg'],                                                                                                                                            
  \ 'hl':      ['fg', 'fzf_hl'],                                                                                                                                            
  \ 'fg+':     ['fg', 'fzf_fgp'],                                                                                                                                           
  \ 'hl+':     ['fg', 'fzf_hlp'],                                                                                                                                           
  \ 'info':    ['fg', 'fzf_info'],                                                                                                                                          
  \ 'prompt':  ['fg', 'fzf_prompt'],                                                                                                                                        
  \ 'pointer': ['fg', 'fzf_pointer'],                                                                                                                                       
  \ 'spinner': ['fg', 'fzf_spinner'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)}
