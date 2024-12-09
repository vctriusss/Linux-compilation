# Linux-compilation
Some configs for Linux

- Distro: Xubuntu 22.04
- DE: xfce4
- TE: xfce4-terminal
- Panel: xfce4-panel
- Shell: zsh + ohmyzsh + powerlevel10k
- Theme: [Dracula](https://draculatheme.com/gtk)
- Font: [JetBrains Mono](https://www.nerdfonts.com/font-downloads)
- Icons: Papirus icons

## Terminal
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
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
```
Then copy dotfiles from repo to homedir

## Appearence
### Font
Install from overview and put it `/usr/share/fonts/ttf`

### Theme
Install from overview and put it `/usr/share/themes`

### Icons
```bash
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get install papirus-icon-theme
```

## Useful utils
```bash
sudo snap install code firefox telegram-desktop
```

```bash
sudo apt install exa bat fd-find rar p7zip-full bzip2 grc most tree htop ranger build-essential openvpn
sudo apt install transmission mpv gparted baobab qt5ct flameshot zathura
sudo add-apt-repository ppa:xubuntu-dev/extras
sudo apt install xfce4-genmon-plugin xfce4-docklike-plugin xfce4-xkb-plugin thunar-font-manager mugshot
```
Make symlinks for some bad-name packages:
```bash
mkdir -p ~/.local/bin
ln -s $(which batcat) ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd
```

Copy `zathurarc` to `~/.config/zathura/zathura`

## Setup Grub
Copy `grub/grub` to `/etc/default/grub` (be careful and check params)

Copy `grub/themes/` to `/boot/grub/`
