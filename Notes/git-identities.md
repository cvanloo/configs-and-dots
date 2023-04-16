# Git Identities

## Create Configuration

```sh
$ git config --global alias.identity-set \
    '! read -p "user.name: " userName; \
    read -p "user.email: " userEmail; \
    read -p "user.signingKey: " userSigningKey; \
    git config --global "user.identities.$1.name" "$userName"; \
    git config --global "user.identities.$1.email" "$userEmail"; \
    git config --global "user.identities.$1.signingKey" "$userSigningKey"; :'

$ git config --global alias.identity-unset  \
    '! git config --global --unset "user.identities.$1.name"; \
    git config --global --unset "user.identities.$1.email"; \
    git config --global --unset "user.identities.$1.signingKey"; :'

$ git config --global alias.identity-use \
    '! git config user.name "$(git config user.identities.$1.name)"; \
    git config user.email "$(git config user.identities.$1.email)"; \
    git config user.signingKey "$(git config user.identities.$1.signingKey)"; :'
```

## Setup

```sh
$ git config --global --unset user.name
$ git config --global --unset user.email
$ git config --global user.useConfigOnly true # remind me to set config
```

## Usage

```sh
$ git identity-set [profile_name]
$ git identity-use [profile_name]
$ git identity-unset [profile_name]
```
