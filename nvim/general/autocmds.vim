"" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd FileType scss setl iskeyword+=@-@
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END
"##############"
"##"Not In Use"##"
"##############"

"autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
"autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
"au BufNewFile,BufRead *.prisma setfiletype graphql
