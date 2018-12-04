<!--ts-->
   * [Parallel](#parallel)
      * [Examples:](#examples)
         * [Example 1: Compress each file in current folder in parallel:](#example-1-compress-each-file-in-current-folder-in-parallel)
         * [Example 2: Download all files listed in a text file in parallel (method 1)](#example-2-download-all-files-listed-in-a-text-file-in-parallel-method-1)
         * [Example 3: Download all files listed in a text file in parallel (method 2)](#example-3-download-all-files-listed-in-a-text-file-in-parallel-method-2)
         * [Example 4: Extract all zip files in current directory to the corresponding folder we just created](#example-4-extract-all-zip-files-in-current-directory-to-the-corresponding-folder-we-just-created)
         * [Example 5: Ping to 255 hosts, and check how many hosts are reachable](#example-5-ping-to-255-hosts-and-check-how-many-hosts-are-reachable)
         * [Example 6: Convert all jpg files  into png files in parallel](#example-6-convert-all-jpg-files--into-png-files-in-parallel)

<!-- Added by: gil_diy, at: 2018-12-04T23:19+02:00 -->

<!--te-->

# Parallel

it's a useful utility which allows you to execute apps/shell scripts in parallel, which means the acutal code will be run in parallel processes or threads,
best suited for map reduce or parallel downloads/uploads.
* probably it reminds you the `xargs` command which i have spoke in the past


## Examples:

### Example 1: Compress each file in current folder in parallel:
```bash
find . -type f | parallel gzip
```

### Example 2: Download all files listed in a text file in parallel (method 1)
```bash
cat url-list.txt | parallel wget -j 4
```

`-j4 = means four jobs in parallel`
`-j0 = means run in parallel in many as possible`


### Example 3: Download all files listed in a text file in parallel (method 2)

```bash
parallel -j 4 wget {} < url-list.txt
```

### Example 4: Extract all zip files in current directory to the corresponding folder we just created

```bash
ls *.zip | parallel 'mkdir {.} && cd {.} && unzip ../{}'
```

### Example 5: Ping to 255 hosts, and check how many hosts are reachable
```bash
seq 1 255 | parallel -j0 ping -c 1 178.63.11.{} 2>&1 | grep '64 bytes' | wc -l
```

### Example 6: Convert all jpg files  into png files in parallel
```bash
parallel convert -resize 800 -quality 95 {} {.}.jpg ::: *.png
```




