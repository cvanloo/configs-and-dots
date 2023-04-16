# Push to Multiple Remotes

```sh
# Setup remotes
$ git remote add all REMOTE-URL-1
$ git remote set-url --add --push all REMOTE-URL-1
$ git remote set-url --add --push all REMOTE-URL-2

# Push to all remotes
$ git push all BRANCH

# Fetch from all remotes
$ git fetch --all

# List all remotes
$ git remote -v
```
