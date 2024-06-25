cd /

# installing stuff

apt install build-essential certbot python3-certbot-nginx gh git neovim nginx net-tools tmux -y
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# neovim config
# make it in root folder because I'll always be using sudo vim anyway

NVIM_CONFIG_DIR="/root/.config/nvim"
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    sudo mkdir -p "$NVIM_CONFIG_DIR"
    echo "Created the Neovim config directory."
fi
cat > "$NVIM_CONFIG_DIR/init.vim" << EOF
set number
" set relativenumber
" syntax off
syntax on
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set showmatch
set cmdheight=2
set incsearch
set hlsearch
set clipboard=unnamedplus
" colorscheme default
filetype plugin on
filetype indent on
set numberwidth=5
set signcolumn=yes
EOF

mkdir -p ~/.config/nvim/pack/airblade/start
cd ~/.config/nvim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q

# shell-related config

echo "export HISTCONTROL=ignoredups" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
source ~/.bashrc

# tmux config

touch ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
echo "setw -g mode-keys vi" >> ~/.tmux.conf
echo "bind-key - split-window -v" >> ~/.tmux.conf
tmux source-file ~/.tmux.conf