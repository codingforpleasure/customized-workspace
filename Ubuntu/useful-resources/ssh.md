# ssh

<!--ts-->
   * [ssh](#ssh)
      * [ssh server](#ssh-server)
      * [ssh client](#ssh-client)
         * [Generating Private and Public keys](#generating-private-and-public-keys)
         * [Logging into server via ssh](#logging-into-server-via-ssh)

<!-- Added by: gil_diy, at: 2019-01-03T10:02+02:00 -->

<!--te-->

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/ssh.png" title="tool tip here">
</p>


## ssh server
sshd is the server (OpenSSH daemon)

make sure on the server the OpenSSH is installed and running:

```bash
service sshd status
```

if it doesn't exist, install it:
```bash
sudo apt install openssh-server
```

## ssh client

### Generating Private and Public keys

```bash
ssh-keygen
```
will generate, the name below are the default,
you\'ll be prompt to modify it:

* Private key:
```bash
~/.ssh/id_rsa
```
* Public key:
```bash
~/.ssh/id_rsa.pub
```

### Logging into server via ssh

```bash
ssh <username>@<ip-address>
```

after you have logged in, you should copy your public key and put it on the server you can easily apply this command:
```bash
cat ~/.ssh/id_rsa.pub | ssh <username>@<ip-address> "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys
```

All public keys resides in the file `~/.ssh/authorized_keys` on the server, you can easily cat the file and see yourself.
