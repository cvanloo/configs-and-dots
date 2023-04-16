# Configuration and Dotfiles

## Neovim

Install Neovim

```sh
git clone https://github.com/neovim/neovim.git # the first time
cd neovim

git pull                                       # subsequent times to update
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Install config

```
git clone https://github.com/cvanloo/configs-and-dots.git # or using SSH:
git clone git@github.com:cvanloo/configs-and-dots.git
cd configs-and-dots

rm -rf ~/.config/nvim
cp -r nvim/ ~/.config/
```
