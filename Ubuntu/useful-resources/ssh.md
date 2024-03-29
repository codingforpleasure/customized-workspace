# ssh

<!--ts-->
   * [ssh](#ssh)
      * [ssh server](#ssh-server)
      * [ssh client](#ssh-client)
         * [Generating Private and Public keys](#generating-private-and-public-keys)
         * [Copying the key to the server](#copying-the-key-to-the-server)
      * [Test the new key](#test-the-new-key)
      * [Setting up connecting fast to ssh server](#setting-up-connecting-fast-to-ssh-server)
      * [Fix a brokem pipe on SSH connection](#fix-a-brokem-pipe-on-ssh-connection)
      * [Fix a brokem pipe on SSH connection (Works!!)](#fix-a-brokem-pipe-on-ssh-connection-works)
      * [Retrieve the new SSH config file](#retrieve-the-new-ssh-config-file)

<!-- Added by: gil_diy, at: Sat 06 Nov 2021 14:12:25 IST -->

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

you can easily check the openssh is working by connecting to the computer itself:
```bash
ssh 127.0.0.1
```

## ssh client

### Generating Private and Public keys

```bash
ssh-keygen
```
This will generate both public key and private key,
you\'ll be prompt to give a name to thhose files

* Private key:
```bash
~/.ssh/my_key
```
* Public key:
```bash
~/.ssh/my_key.pub
```

### Copying the key to the server

```bash
ssh-copy-id -i ~/.ssh/mykey user@host
```
This logs into the server host, and copies keys to the server, and configures them to grant access by adding them to the authorized_keys file. The copying may ask for a password or other authentication for the server.

**Only the public key is copied to the server. The private key should never be copied to another machine. **


## Test the new key

Once the key has been copied, it is best to test it:

```bash
ssh -i ~/.ssh/mykey user@host
```

The login should now complete without asking for a password. Note, however, that the command might ask for the passphrase you specified for the key.


[reference](https://www.ssh.com/ssh/copy-id)

## Setting up connecting fast to ssh server

For avoiding inserting the following command each time:

```bash
ssh -i ~/.ssh/<private-key> shay@<ip-address>
```

You can configure a profile in the file: `~/ssh/config`,
The content of the file would be like this, basic fields for each user.

```bash
Host shay_pc
    User shay
    HostName 192.168.1.6
    IdentityFile ~/.ssh/shay_linux_pc

Host ec2_amazon
    User gil
    HostName ...
    IdentityFile ~/.ssh/gil_linux_pc
```

so now you can just enter in the shell:
```bash
ssh shay_pc
```

## Fix a brokem pipe on SSH connection

Add the following lines into `/etc/ssh/ssh_config` for Linux and Mac:

```bash
Host *
ServerAliveInterval 120
```

[Link](https://www.baeldung.com/linux/ssh-keep-alive)

## Fix a brokem pipe on SSH connection (Works!!)

```bash
ssh -i ~/.ssh/wavitai.pem -o TCPKeepAlive=yes -o ServerAliveCountMax=20 -o ServerAliveInterval=15 ubuntu@ec2-34-212-178-18.us-west-2.compute.amazonaws.com'
```

To have the client sending “keep-alive” messages every 15 seconds. If the limit of 20 consecutive messages do not get an answer back from the server – which accounts for 20x15 = 5 minutes – then it is understood the connection is broken/dead and the client process ends.

## Retrieve the new SSH config file

```bash
sudo service sshd restart
```

Afterwards check the ssh state:

```bash
service sshd status
```