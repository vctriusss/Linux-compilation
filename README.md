# Linux-compilation
Some configs &amp; cheetsheets for Linux overall

## Installing zsh & p10k
```bash
sudo apt install zsh exa bat
# change batcat to bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
# setup zsh
chsh -s $(which zsh)
# log out && log in
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# copy dotfiles from repo to homedir
```
