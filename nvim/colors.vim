colorscheme base16-default-dark

" colors
let s:bgcolor = "#181818"
let s:fgcolor = "#D8D8D8"
let s:brcolor = "#FFB347"

" modifications for gutter coloring
function! s:SetColors(group, fg, bg)
    exec "hi " . a:group . " guifg=" . a:fg . " guibg=" . a:bg
endfunction
call s:SetColors("SignColumn", s:fgcolor, s:bgcolor)
call s:SetColors("NonText", s:bgcolor, s:bgcolor)
call s:SetColors("CursorLineNr", s:brcolor, s:bgcolor)
call s:SetColors("LineNr", s:fgcolor, s:bgcolor)

" modifications for splits
call s:SetColors("VertSplit", s:brcolor, s:bgcolor)
call s:SetColors("StatusLine", s:fgcolor, s:bgcolor)
call s:SetColors("StatusLineNC", s:bgcolor, s:bgcolor)

unlet s:fgcolor s:bgcolor s:brcolor
delf s:SetColors
