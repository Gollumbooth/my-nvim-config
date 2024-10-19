set number
set relativenumber
set tabstop=4
set shiftwidth=4
set wildmenu

filetype plugin on
syntax on

set encoding=UTF-8

call plug#begin()

Plug 'scrooloose/nerdtree'  " NerdTree
Plug 'vim-airline/vim-airline'  " Airline
Plug 'ap/vim-css-color'  " Preview the css color
Plug 'rafi/awesome-vim-colorschemes'  " Awesome vim colorschemes
Plug 'ryanoasis/vim-devicons'  " Developement icons
Plug 'williamboman/mason.nvim'  " Auto install and manager lsp
Plug 'williamboman/mason-lspconfig.nvim'  " Mason lspconfig
Plug 'neovim/nvim-lspconfig'  " neovim lsp config
Plug 'neoclide/coc.nvim'  " completion
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" colorscheme onedark
colorscheme catppuccin

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_right_sep = ""
let g:airline_left_sep = ""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ""
let g:airline#extensions#tabline#left_alt_sep = ""

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd" },
})
require("lspconfig").clangd.setup {}
EOF

if exists("g:neovide")
	let g:airline_right_sep = ""
    let g:airline_left_sep = ""

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ""
    let g:airline#extensions#tabline#left_alt_sep = ""

    set guifont=JetBrainsMono\ Nerd\ Font:h10

endif

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
