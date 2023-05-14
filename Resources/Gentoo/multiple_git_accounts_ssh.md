# Using multiple git (-hub/-lab) accounts over ssh

1. Create your ssh keys

	# Enter ssh directory
	$ cd ~/.ssh

	# Create personal ssh key
	$ ssh-keygen
	-> Enter file in which to save the key: # <Enter> (use default)

	# Create work account
	$ ssh-keygen -t rsa -C "my.work@email.com"
	-> Enter file in which to save the key: id_rsa_work

2. Create ssh config

	$ vim ~/.ssh/config
	-------------------
	# Personal account, - the default
	Host github.com
		HostName github.com
		User git
		IdentityFile ~/.ssh/id_rsa

	# Work account
	Host github-work
		HostName github.com
		User git
		IdentityFile ~/.ssh/id_rsa_work

3. Add Keys to GitHub (or -Lab or whatever)

Account Icon at top right of the page -> Settings -> SSH and GPG keys -> New
SSH key

	$ xsel -b -i < ~./ssh/id_rsa.pub

Paste the key into GitHub.

Repeat the same for the other key:

	$ xsel -b -i < ~./ssh/id_rsa_tbz.pub

4. Finish setup of ssh keys

	# Add the private keys to the openssh auth agent
	$ ssh-add ~/.ssh/id_rsa
	$ ssh-add ~/.ssh/id_rsa_tbz

	# Test the connection
	$ ssh -T git@github.com
	$ ssh -T git@github-work

5. Clone a repo with your personal (default) account

	$ git clone git@github.com/org/project.git

6. Clone a repo with your work account

	$ git clone git@github-work/org/project.git /path/to/project
	$ cd /path/to/project
	$ git config user.name "My Work Name"
	$ git config user.email "my.work@email.com"
