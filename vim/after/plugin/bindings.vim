" Binding overrides.
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr> <CR> pumvisible() ? neocomplete#close_popup()."<Plug>delimitMateCR" : "<Plug>delimitMateCR"
