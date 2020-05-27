# vlc	

**Streaming**

## **On the server side:**
1. File -> Stream
2. Add file
3. Click **Stream**
4. In the combobox pick **HTTP**, press **Add**.
5. Fill Port: 8080
6. In the text box fill,
   Path: 
   ```
   /stream
   ```
Output string should be like this:

```bash
:sout=#transcode{vcodec=h264,scale=Auto,acodec=mpga,ab=128,channels=2,samplerate=44100,scodec=none}:http{mux=ffmpeg{mux=flv},dst=:8080/stream} :sout-all :sout-keep


```

## **On the client side:**

1. Open Network Stream 
2. Fill the network url:
```
http://@<Server's ip address>:8080/stream
```

3. Wait for some time, it will start.


## **On the client side (mobile device - Android ):**

1. Open **VLC for Android**
2. Go to the menu, and pick: **Stream**.

   Enter network address:

```
http://@<Server's ip address>:8080/stream
```

3. Wait for some time, it will start.