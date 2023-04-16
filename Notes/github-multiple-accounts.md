# GitHub Multiple Accounts SSH

1. Generate SSH keys

```sh
$ ssh-keygen -t ed25519 -C "my@email.com"
> Enter file... : /home/me/.ssh/id_ed25519_myaccount
> Passphrase: (optional)
```

2. Add SSH key to ssh-agent

```sh
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519_myaccount
```

3. Add SSH public key to GitHub account

4. Repeat for all other accounts

5. Configure SSH `~/.ssh/config`

```ssh_config
# default github account: myaccount
Host github.com
    Hostname github.com
    IdentityFile ~/.ssh/id_ed25519_myaccount
    IdentitiesOnly yes

Host github-second
    Hostname github.com
    IdentityFile ~/.ssh/id_ed25519_second
    IdentitiesOnly yes
```

6. Test connection

```sh
$ ssh -T git@github.com # Hi myaccount!
$ ssh -T git@github-second # Hi second!
```

7. Repo URL for second:

```
git@github-second:owner/project.git
```
