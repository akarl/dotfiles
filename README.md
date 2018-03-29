## Base system
- networkmanager
- git
- yaourt

## WM

- xorg
- xclip
- i3-wm
- compton
- xdg-utils
- dunst
- polybar
- rofi
- i3lock-color
- xss-lock-git
- gnome-keyring
- seahorse
- mate-polkit
- ttf-font-awesome
- ttf-source-code-pro-ibx
- xbanish
- udiskie
- autorandr

## Terminal
- termite
- antigen-git
- zsh (`chsh --shell /usr/bin/zsh`)

## Apps
- google-chrome
- dropbox (`systemctl enable dropbox@username.service`)
- neovim
- pass
- feh
- ranger
- fzf
- spotify
- neomutt
- notmuch
- isync
- rofi-pass

## Go
- go
- godep


Start gnome-keyring-daemon automatically at login and unlock the keyring
using PAM. See https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
