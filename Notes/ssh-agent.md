# SSH Agent

Saves you from having to enter your password every time you want to unlock a
GPG/SSH key to sign a git commit.

https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
https://wiki.archlinux.org/title/SSH_keys#SSH_agents

```systemd
; ~/.config/systemd/user/ssh-agent.service
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

```fish
# ~/.config/fish/config.fish
set --export SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
```

```sh
systemctl --user enable --now ssh-agent
```

```ssh_config
# ~/.ssh/config
AddKeysToAgent yes
```
