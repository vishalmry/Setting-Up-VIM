set nu 
set cursorline
highlight Comment cterm=italic
set autoindent
set mouse=a

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
 set termguicolors
endif

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required



"" Specify a directory for plugins Specif 
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'jiangmiao/auto-pairs'

Plug 'crusoexia/vim-monokai'

Plug 'hzchirs/vim-material'

Plug 'nightsense/simplifysimplify'

Plug 'itchyny/lightline.vim'

Plug '/powerline/powerline'

Plug 'kadekillary/subtle_solo'

Plug 'kristijanhusak/vim-hybrid-material'

Plug 'NLKNguyen/papercolor-theme'

" Plug 'itchyny/lightline.vim'

" Plug 'bling/vim-airline'

" Initialize plugin system
call plug#end()


syntax enable
set background=dark
colorscheme vim-material
" colorscheme fruchtig
" colorscheme simplifysimplify-light
set laststatus=2

" let g:lightline = {}

let g:palenight_terminal_italics=1
" let g:lightline.colorscheme = 'subtle_dark'


" Open multiple lines (insert empty lines) before or after current line,
" and position cursor in the new space, with at least one blank line
" before and after the cursor.
function! OpenLines(nrlines, dir)
  let nrlines = a:nrlines < 3 ? 3 : a:nrlines
  let start = line('.') + a:dir
  call append(start, repeat([''], nrlines))
  if a:dir < 0
    normal! 2k
  else
    normal! 2j
  endif
endfunction
" Mappings to open multiple lines and enter insert mode.
nnoremap <Leader>o :<C-u>call OpenLines(v:count, 0)<CR>S
nnoremap <Leader>O :<C-u>call OpenLines(v:count, -1)<CR>S
set foldmethod=manual

set linespace=3
set guioptions-=T
set guioptions-=m
hi CursorLine cterm=none


let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1


" powerline statusline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
