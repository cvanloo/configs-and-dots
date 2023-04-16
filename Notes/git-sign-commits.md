# Git Sign Commits

1. Create GPG Keys

```sh
$ gpg --gen-key [--allow-freeform-uid]
```

2. Configure Git (or use identity-use)

```sh
$ gpg --list-secret-keys --keyid-format=long
> sec rsa3072/KEYIDHERE
> ...

$ git config user.signingKey KEYIDHERE
```

3. Add key to GitHub/GitLab/...

```sh
$ gpg --armor --export KEYIDHERE [| xsel -bi]
```

-> Now add the key to GitHub/GitLab account.

4. Sign Things

```sh
$ git commit -S
$ git log --show-signature
$ git merge -S --verify-signatures
$ git tag -s
$ git tag -v # verify
```

## Validate someone else's signature.

1. Download the GPG public key

GitHub:

```sh
curl -O https://github.com/<username>.gpg
```

GitLab: ???

2. Import key

```sh
gpg --import <public-key-file>
```
