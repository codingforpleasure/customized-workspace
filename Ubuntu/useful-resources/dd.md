<!--ts-->
   * [dd (disk dump)](#dd-disk-dump)
      * [examples:](#examples)
         * [Create a file weights 512MB with only zeros:](#create-a-file-weights-512mb-with-only-zeros)
         * [Put ISO on my thumb-drive:](#put-iso-on-my-thumb-drive)
         * [Make blank drive:](#make-blank-drive)
         * [For getting info during dd progression:](#for-getting-info-during-dd-progression)

<!-- Added by: gil_diy, at: 2018-12-01T12:05+02:00 -->

<!--te-->


# dd (disk dump)

## examples:

### Create a file weights 512MB with only zeros:

```bash
sudo dd if=/dev/zero of=zero bs=1024k count=512
```
* if = input file

* of = output file

* bs = block size

* count = is the number of block sizes

comments:
in Linux:
* /dev/zero is a virtual device which spits zeros
* /dev/random is a virtual device which spits random characters

### Put ISO on my thumb-drive:
First you should recognize the thumb-drive on your system, two approaches.
either use `lsblk` or use `dmesg` after thumb drive was connected (sdx)
unmount the thumbdrive via `umount` (mounting point in listed in lsblk).


```bash
sudo dd if=~/Downloads/my_image.iso of=/dev/sdc
```

so if next time you'll connect this thumbdrive this bootable iso will get mounted into your file system automatically by `udev`, you can easily make sure with lsblk.

### Make blank drive:

```bash
sudo dd if=/dev/zero of=/dev/sdc
```

### Getting info during dd progression:

just add `status=progress`:

```bash
sudo dd status=progress if=~/Downloads/my_image.iso of=/dev/sdc
```
