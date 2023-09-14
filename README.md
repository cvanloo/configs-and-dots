# Configuration and Dotfiles

## Installation Guides

- [Arch Linux](./Arch_Installation_Guide.md)
- [Gentoo Linux](./Gentoo_Installation_Guide.md)
- [NixOS](./Nixos_Installation_Guide.md)
- [Additional Notes](./Notes/)

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

### Neovim Commands and Motions

- [Commands and Montions](./nvim_cmds.md)
- [Vim](./vim.md)

#### TODO: I should probably setup symlinks
