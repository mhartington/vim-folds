"{{{
let s:exclude_tags_list = [
      \ '\/',
      \ '!',
      \ 'html',
      \ 'area',
      \ 'base',
      \ 'br',
      \ 'col',
      \ 'embed',
      \ 'hr',
      \ 'img',
      \ 'input',
      \ 'keygen',
      \ 'link',
      \ 'menuitem',
      \ 'meta',
      \ 'param',
      \ 'source',
      \ 'track',
      \ 'wbr'

      \ ]
let s:exclude_tags = join(s:exclude_tags_list, '\|')
"}}}

function! HTMLFolds() "{{{
  let line = getline(v:lnum)

  " Ignore tags that open and close in the same line
  if line =~# '<\([^ >]\+\).*<\/\1>'
    return '='
  endif

  if line =~# '<\%(' . s:exclude_tags . '\)\@!'
    return 'a1'
  endif

  if line =~# '<\/\%(' . s:exclude_tags . '\)\@!'
    return 's1'
  endif

  return '='
endfunction "}}}

