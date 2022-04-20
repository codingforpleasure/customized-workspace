<!--ts-->
   * [SCP (OpenSSH secure file copy)](#scp-openssh-secure-file-copy)
      * [Copy from local computer to EC2 instance](#copy-from-local-computer-to-ec2-instance)

<!-- Added by: gil_diy, at: Wed 10 Nov 2021 16:19:49 IST -->

<!--te-->

# SCP (OpenSSH secure file copy)

Example:
 scp <files in locl host> <ip address of remote host>:<path-to-directory-in-remote-host>
```bash
 scp ./docker-compose.yml <username>@<computer-ip>:/home/shay/from_gil
```

Steps to debug:
1. Make sure ssh is working properly, since scp wors on ssh tunnel.
2. if it passed the ssh test, debug scp with -vv flag.


## Copy from local computer to EC2 instance

1. You need a pem file, which you have generated.

If you don't have then click 'create key pair'


In your shell just enter:

```bash
scp -i /path/my-key-pair.pem /path/my-file.txt ec2-user@my-instance-public-dns-name:path/
```