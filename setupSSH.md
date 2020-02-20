# Setup SSH (without password)

1. copy your public key to the host: `scp -p your_pub_key.pub user@host:`
2. connect to your host: `ssh user@host`
3. append your key to keys: `host$ cat your_pub_key.pub >> ~/.ssh/authorized_keys`

finished :)
