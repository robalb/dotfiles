
" ---------- ASPECT & BEHAVIOUR -----------
"
" Switch on highlighting the last used search pattern.
set hlsearch
" theme
syntax on
colorscheme gruvbox
set background=dark

" display line number
set number

" https://tedlogan.com/techblog3.html
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set listchars=tab:>·,extends:»,precedes:«,nbsp:‡,trail:·
set nowrap
set list

set autoindent
set smartindent

let g:indentLine_char = '¦'

let g:airline_theme='base16'

" automatically set the current file to the working directory. may break stuff
set autochdir


" save undo history even when a buffer is closed
" By default neovim saves the undofile in the dedicated directory in the
" application data folder. The default is good, we don't have to configure anything else
set undofile




" ---------- MAPPINGS ------------

"this way of setting the leader to space may not work on all vim versions
" let mapleader = "\<Space>"
map <space> <leader>


" backspace in Visual mode deletes selection
vnoremap <BS> d

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>


"fast navigation 
nnoremap <space><space> /

"audo add semicolumn
inoremap ;; <C-o>A;
nnoremap ;; A;<Esc>


" alt-v permette di entrare in visual block mode (uguale a ctr-v)
" nnoremap <A-v> <C-V>

" custom digraphs. usage:  ctrl+k {char 1} {char 2}
" char ~
digraph ss 126
" char `
digraph kk 96


"If you want n to always search forward and N backward, use this:
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

"use backspace to delete the highlight of searched words
nnoremap <BS> :noh<CR>
" leader h also deletes the highlight, compatible with lunarvim behaviour
nnoremap <leader>h :noh<CR>

"quick vertical resize
nnoremap <leader>> <C-W>15>
nnoremap <leader>< <C-W>15<

"start find replace command
" nnoremap <leader>f :%s:::g<Left><Left><Left>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

"multiline word replacement:
"shortcut for: -searching a word, -changing it with cgn, -pressing dot to
"repeat the action on the next word
nnoremap <leader>c *Ncgn

"multiline word deletion
nnoremap <leader>d *Ndgn

"toggle filetree
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeToggle<CR>


" ---------- PLUGINS -----------

lua require('plugins')

" automatically run :PackerCompile whenever lua/plugins.lua updates
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
