#!/bin/bash

install Get directory for symlink script.
DOTFILES_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

shopt -s nullglob
shopt -s dotglob

## Link to ~.
for folder in compton git rtorrent system tmux; do
  for f in "$DOTFILES_DIR"/"$folder"/*; do
    ln -sfv "$f" ~/
  done
done

## Link to ~/.$folder.
for folder in bin ncmpcpp templates weechat; do
  # rm -rf ~/.$folder
  mkdir -pv ~/.$folder/
  for f in "$DOTFILES_DIR"/"$folder"/*; do
    ln -sfv "$f" ~/.$folder/
  done
done

## Link to .config/$folder.
for folder in fontconfig htop i3 mpd mpv polybar ranger; do
  # rm -rf ~/.config/$folder
  mkdir -pv ~/.config/$folder/
  for f in "$DOTFILES_DIR"/"$folder"/*; do
    ln -sfv "$f" ~/.config/$folder/
  done
done

## Link dunst config.
mkdir -pv ~/.config/dunst/
"$DOTFILES_DIR"/bin/compile-color-template dunst/dunstrc.template dunst/dunstrc
ln -sfv "$DOTFILES_DIR/dunst/dunstrc" ~/.config/dunst/

## Link zathura config.
mkdir -pv ~/.config/zathura/
"$DOTFILES_DIR"/bin/compile-color-template zathura/zathurarc.template zathura/zathurarc
ln -sfv "$DOTFILES_DIR/zathura/zathurarc" ~/.config/zathura/

## Link vim options.
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~/
ln -sfv "$DOTFILES_DIR/vim/.tern-config" ~/
ln -sfv "$DOTFILES_DIR/vim/.clang_complete" ~/

ln -sfv "$DOTFILES_DIR/vim/after" ~/.vim/
ln -sfv "$DOTFILES_DIR/vim/minisnip" ~/.vim/

mkdir -pv ~/.vim/.undo/ ~/.vim/.backup/ ~/.vim/.swp/ ~/.tags/

## Link misc options.
ln -sfv "$DOTFILES_DIR/misc/redshift.conf" ~/.config/
ln -sfv "$DOTFILES_DIR/fonts/fonts.conf" ~/.config/fontconfig/

mkdir -pv ~/.config/networkmanager-dmenu/
ln -sfv "$DOTFILES_DIR/i3/config.ini" ~/.config/networkmanager-dmenu/

## Create tmp folder for i3.
mkdir -pv ~/.tmp/

## Set gnome settings.
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"

## Create a playlist folder and database file for mpd.
mkdir -pv ~/.config/mpd/playlists/
touch ~/.config/mpd/database

## Create screenshot folder for mpv.
mkdir -pv ~/Pictures/Screenshots/

## Create complete, incomplete, and session folders for rtorrent.
mkdir -pv ~/Downloads/complete/ ~/Downloads/incomplete/ ~/.rtorrent.sessions/

## Apply ~/.xresources.
xrdb ~/.Xresources
