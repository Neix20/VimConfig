# Windows:

# scoop install lsd
# scoop install grep
# scoop install gcc

# scoop install openssh
# scoop install cmake
# scoop install make

# scoop install clang
# scoop install python
# scoop install nodejs
# scoop install lua

# scoop install neovim
# scoop install fzf
# scoop install silversearcher-ag
# scoop install universal-ctags

# Linux:
echo "Now Installing Packages"

pkg install openssh
pkg install cmake
pkg install make

pkg install clang
pkg install python
pkg install nodejs

pkg install openjdk
pkg install lua

pkg install neovim
pkg install fzf
pkg install silversearcher-ag
pkg install universal-ctags

# Clone Vim Config
mkdir -p ~/.config/nvim
cd ~/.config/nvim
git clone https://github.com/Neix20/VimConfig .
cd ~

# Clone Packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Completed Installing Packages"
