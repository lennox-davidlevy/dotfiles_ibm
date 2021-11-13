" curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
       "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
		Plug 'tpope/vim-surround'
		call plug#end()
		source $HOME/.config/nvim/general/vscodeSettings.vim
		source $HOME/.config/nvim/general/vscodeKeymaps.vim
		filetype plugin indent on
		filetype plugin on
		syntax on
else
    "neovim in terminal
		
		"ColorSchemes
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/seoul256.vim'
		Plug 'flazz/vim-colorschemes'
		Plug 'morhetz/gruvbox'
		Plug 'tek256/simple-dark'
		Plug 'altercation/vim-colors-solarized'
		Plug 'huyvohcmc/atlas.vim'
		Plug 'davidosomething/vim-colors-meh'
		Plug 'andreypopp/vim-colors-plain'
		Plug 'fxn/vim-monochrome'
		Plug 'ewilazarus/preto'
		Plug 'hardselius/warlock'
		Plug 'Lokaltog/vim-monotone'
		
		"Utilities
		Plug 'airblade/vim-gitgutter'
		Plug 'stephpy/vim-yaml'
		Plug 'tpope/vim-fugitive'
		Plug 'rktjmp/lush.nvim'
		Plug 'preservim/nerdtree'
		Plug 'jiangmiao/auto-pairs'
		Plug 'itchyny/lightline.vim'
		Plug 'mengelbrecht/lightline-bufferline'
		Plug 'tpope/vim-surround'
		Plug 'preservim/nerdcommenter'
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
		Plug 'airblade/vim-rooter'
		Plug 'ap/vim-css-color'
		Plug 'mbbill/undotree'
		Plug 'christoomey/vim-tmux-navigator'
		Plug 'mhinz/vim-startify'
		Plug 'lifepillar/pgsql.vim'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

		call plug#end()

		"Source vim configs files 
		source $HOME/.config/nvim/general/settings.vim
		source $HOME/.config/nvim/general/keymaps.vim
		source $HOME/.config/nvim/general/autocmds.vim
		source $HOME/.config/nvim/vim-plugs/lightline.vim
		source $HOME/.config/nvim/vim-plugs/coc.vim
		source $HOME/.config/nvim/vim-plugs/fzf.vim
		source $HOME/.config/nvim/vim-plugs/limelight.vim
		source $HOME/.config/nvim/vim-plugs/nerdtree.vim
		
		filetype plugin indent on
		syntax on
		"set background=dark
		"colorscheme Atelier_EstuaryDark
		"colorscheme monotone
		"colorscheme simple-dark 
		colorscheme gruvbox
		hi Normal guibg=NONE ctermbg=NONE

		"Nerdtree thing
		map <leader>r :NERDTreeFind<cr>
		""" PSQL
		let g:sql_type_default = 'pgsql'
		""" vim-yaml
		let g:yaml_limit_spell = 1
" Fix auto-indentation for YAML files
		"augroup yaml_fix
		"    autocmd!
		"    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
		"augroup END

		""" coc-prettier
		command! -nargs=0 Prettier :CocCommand prettier.formatFile
endif
