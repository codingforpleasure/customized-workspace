<!--ts-->
<!--te-->

# mktemp

creates a temporary file or directory. Create a temporary file or directory, safely, and print its name.

If your script needs to write data temporarily to a small file, then /tmp is probably a good location for that file, but what should it be called?
mktemp creates a new file each time you call it

```bash
mktemp -p /tmp foobar.XXXXXXXX
```
