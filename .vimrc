let mapleader = ' '

set number
set relativenumber
set mouse=a
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" WSL yank support (copy to Windows clipboard)
if executable('clip.exe')
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('clip.exe', @0) | endif
  augroup END
endif

" colorscheme
set background=dark
colorscheme gruvbox

"LSP Plugin config
packadd lsp

" Go language server
call LspAddServer([#{
	\    name: 'golang',
	\    filetype: ['go', 'gomod'],
	\    path: '/home/jake/go/bin/gopls',
	\    args: ['serve'],
	\    syncInit: v:true
	\  }])
call LspOptionsSet(#{
        \   showDiagWithVirtualText: v:true,
        \ })

nnoremap <leader>lr :LspRename<CR>
nnoremap <leader>ld :LspDiagFirst<CR>
nnoremap <leader>la :LspCodeAction<CR>
nnoremap <leader>ls :LspDocumentSymbol<CR>
nnoremap <C-f> :LspFormat<CR>
nnoremap K :LspHover<CR>

" Which-key plugin
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

