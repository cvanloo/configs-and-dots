# reMarkable

## Create a backup

* Connect reMarkable via USB
* On the reMarkable navigate to Menu -> Settings -> Help -> Copyrights and licenses
* Scroll down a bit to see the ssh password and IP addresses
* Create a ssh config on your host computer

		vim ~/.ssh/config
		-----------------
		host remarkable
			Hostname 10.11.99.1
			User root
* Connect via ssh and enter the password when prompted

		ssh remarkable
* Create the ssh folder

		mkdir ~/.ssh
* Setup ssh keys: From your host run:

		cat ~/.ssh/id_rsa.pub | ssh remarkable "cat >> .ssh/authorized_keys"
* This now allows you to simply connect to your reMarkable by running `ssh remarkable`, without needing a password.
* Backup files: From your host run:

		mkdir -p remarkable-backup/files # backup directory
		scp -r remarkable:~/.local/share/remarkable/xochitl/ remarkable-backup/files # backup files
		scp remarkable:~/.config/remarkable/xochitl.conf remarkable-backup/ # backup config
		scp remarkable:/usr/bin/xochitl remarkable-backup/ # backup xochitl binary
