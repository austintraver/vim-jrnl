" Number of spaces that a <Tab> in the file counts for.
setlocal tabstop=4
" Number of spaces to use for each step of (auto)indent.
" Used for |'cindent'|, |>>|, |<<|, etc.
" When 'shiftwidth' is 0, the value of 'tabstop' is used instead.
setlocal shiftwidth=0
" When 'softtabstop' is negative, the value of 'shiftwidth' is used instead.
setlocal softtabstop=-1
" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
setlocal shiftround
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on.
setlocal expandtab

highlight JrnlTag ctermfg=3 guifg=#F8CC7A
highlight JrnlEntryLine guifg=#66C9FF guibg=none gui=bold,underline
highlight JrnlBracket ctermfg=7 cterm=bold guifg=#545454 guibg=none
highlight JrnlDate ctermfg=4 guifg=#545454 guibg=none
highlight JrnlNope ctermfg=none ctermbg=none guifg=none guibg=none gui=none
highlight JrnlBoxEmpty guifg=#CBE697
highlight JrnlBoxDone ctermfg=2 guifg=#545454 gui=strikethrough
highlight JrnlBoxQuestion ctermfg=5 guifg=#B283AF
highlight JrnlBoxInfo ctermfg=6 guifg=#9CDBFC


" Nopes

" These get overridden by indentLine, so we need matchadd
call matchadd('Conceal', '- \[ \]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[x\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[?\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[!\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[c\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[i\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\.\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\*\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '^\s*\zs-\ze [^\[]', 10, -1, { 'conceal': ''})

function! JrnlFolds()
  let line = getline(v:lnum)
  if match(line, '\v^\s*#/-+/?#?\s*$') >= 0
    return "s1"
  elseif match(line, '\v^\s*#-+#?\s*$') >= 0
    return "a1"
  elseif match(line, '\v^\s*#{5} ') >= 0
    return ">6"
  elseif match(line, '\v^\s*#{4} ') >= 0
    return ">5"
  elseif match(line, '\v^\s*#{3} ') >= 0
    return ">4"
  elseif match(line, '\v^\s*#{2} ') >= 0
    return ">3"
  elseif match(line, '\v^(\s*# |\*{1,2})') >= 0
    return ">2"
  elseif match(line, '\v^\[\d{4}(-\d\d){2} \d?\d(:[0-6]\d){1,2}( [apAP][mM])?\] ') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=JrnlFolds()
