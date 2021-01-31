<!--ts-->
<!--te-->

A documentation well explained: https://ngrok.com/docs

#Expose a local web server to the internet


[Link](https://www.youtube.com/watch?v=DCxt9SAnkyc)

## Download ngrok

[Download link](https://ngrok.com/download)

## How to forward port from local host to remote server:

In my case the app i'm running on my localhost is on port 4000, therefore I wrote:

```bash
./ngrok http 4000
```