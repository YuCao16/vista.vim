" Copyright (c) 2019 Liu-Cheng Xu
" MIT License
" vim: ts=2 sw=2 sts=2 et

if exists('b:current_syntax')
  finish
endif

let icons = join(values(g:vista#renderer#icons), '\|')
execute 'syntax match VistaIcon' '/'.icons.'/' 'contained'

syntax match VistaPublic /^\s*+\</ contained
syntax match VistaProtected /^\s*\#\</ contained
syntax match VistaPrivate /^\s*-\</ contained

syntax match VistaParenthesis /(\|)/ contained
syntax match VistaArgs  /(.*)/
syntax match VistaColon /:\ze\d\+$/ contained nextgroup=VistaLineNr
syntax match VistaLineNr /\d\+$/
syntax match VistaScopeKind /\S\+\zs \a\+\ze:\d\+$/ nextgroup=VistaColon
syntax match VistaKind / \a*\ze:\d\+$/ contained
syntax match VistaScope /^\S.*$/ contains=VistaPrivate,VistaProtected,VistaPublic,VistaKind,VistaIcon,VistaParenthesis
syntax region VistaTag start="^" end="$" contains=VistaLineNr,VistaScope,VistaPrivate,VistaProtected,VistaPublic,VistaArgs,VistaScopeKind,VistaColon,VistaKind,VistaIcon,VistaParenthesis
" syntax match VistaColon /:/ contained
" syntax match VistaScopeKind /: .*$/ contains=VistaArgs,VistaColon,VistaLineNr
" syntax match VistaKind / \a*:\d*$/

hi default link VistaParenthesis Operator
hi default link VistaScope       Function
hi default link VistaKind        Type
hi default link VistaScopeKind   Define
hi default link VistaLineNr      Function
hi default link VistaColon       SpecialKey
hi default link VistaIcon        StorageClass
hi default link VistaArgs        Comment
" hi default link VistaLineNr      LineNr

hi default VistaPublic     guifg=Green  ctermfg=Green
hi default VistaProtected  guifg=Blue ctermfg=Blue
hi default VistaPrivate    guifg=Red    ctermfg=Red

" Do not touch the global highlight group.
" hi! link Folded Function

if has('nvim')
  call setwinvar(winnr(), '&winhl', 'Folded:Function')
endif

let b:current_syntax = 'vista'
