## aws-cli download & install

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

sudo ./aws/install
```

```bash
/usr/local/bin/aws --version
```


## update your current installation of the AWS CLI
```bash
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
```


## File transfer easily from local to remote ec2 using Filezila

https://angus.readthedocs.io/en/2014/amazon/transfer-files-between-instance.html
