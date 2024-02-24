# Linux-compilation
Some configs &amp; cheetsheets for Linux overall

## Installing zsh & p10k
Setup zsh:
```bash
sudo apt install zsh git
chsh -s $(which zsh)
# log out && log in
```
Setup ohmyzsh:
```bash
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Install p10k & plugins:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Then copy dotfiles from repo to homedir

## Useful utils
```bash
sudo snap install code firefox telegram-desktop
```

```bash
sudo apt install exa bat rar p7zip-full bzip2 grc most tree htop ranger build-essential openvpn
sudo apt install transmission mpv
sudo apt install xfce4-genmon-plugin thunar-font-manager mugshot
```
Change `batcat` to `bat`:
```bash
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```
