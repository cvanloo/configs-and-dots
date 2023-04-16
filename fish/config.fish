set --export GOPATH "$HOME/go"
set --export PATH "$PATH:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:/opt:$HOME/.dotnet/tools"
set --export EDITOR nvim
set --export SUDO_EDITOR nvim
set --export GIT_EDITOR nvim
set --export TERM xterm-256color
set --export MANPAGER "nvim +Man!"

# Fix Dumb Java Apps
set --export _JAVA_AWT_WM_NONREPARENTING 1

# Japanese Input
set --export GTK_IM_MODULE fcitx
set --export QT_IM_MODULE fcitx
set --export SDL_IM_MODULE fcitx
set --export XMODIFIERS "@im=fcitx"

# SSH Agent
# See `.config/systemd/user/ssh-agent.service`
set --export SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Carp
set --export CARP_DIR "$HOME/.local/lib/carp"

if [ -f /usr/share/autojump/autojump.fish ]
    source /usr/share/autojump/autojump.fish
end

source "$HOME/.config/fish/abbreviations.fish"

fish_vi_key_bindings
bind -M insert \cz 'fg'
