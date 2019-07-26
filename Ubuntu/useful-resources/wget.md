<!--ts-->
   * [wget](#wget)
      * [Basic](#basic)
         * [Example 1: Download a single page](#example-1-download-a-single-page)
         * [Example 2: Download recursively all files connected to this page  |](#example-2-download-recursively-all-files-connected-to-this-page--)
         * [Example 3: Discovering broken links in a website](#example-3-discovering-broken-links-in-a-website)
         * [Example 4: Download specific files](#example-4-download-specific-files)
         * [Example 5: Download files avoid downloading specific file extensions](#example-5-download-files-avoid-downloading-specific-file-extensions)
         * [Example 6: You have a file that contains the URLs you want to download? Use the ‘--input-file’:](#example-6-you-have-a-file-that-contains-the-urls-you-want-to-download-use-the---input-file)
         * [Example 7: Add random delay between requests:](#example-7-add-random-delay-between-requests)
         * [Example 8: Download only files with a specific regex](#example-8-download-only-files-with-a-specific-regex)

<!-- Added by: gil_diy, at: 2019-07-27T01:49+03:00 -->

<!--te-->

# wget

## Basic

### Example 1: Download a single page
```bash
$ wget <address dst>
```

### Example 2: Download recursively all files connected to this page  |
```bash
wget --recursive <address dst>
```

### Example 3: Discovering broken links in a website
```bash
$ wget --recursive --spider --no-directories --wait 1 --level 2 --output-document=out.log  <address dst>
```
*  Don't create directories and explore with recursion depth 2, waits between retrievals for 1 second.
*  Those with return 404, means the page was not found, the rest will receive 200 OK

### Example 4: Download specific files

```bash
wget --no-directories -r --directory-prefix /save/location --accept jpg,png <address dst>
```

`--accept` = Specify comma-separated lists of file name suffixes or patterns to accept or reject

--directory-prefix = sets the directory prefix where all files and directories are saved to.

### Example 5: Download files avoid downloading specific file extensions

Let's say you're working only on text, so images are less relevant,
therefore let's ignore jpg,jpeg, svg, png, bmp
```bash
wget --no-directories -r --directory-prefix /save/location --reject jpg,jpeg,png,svg,bmp <address dst>
```


### Example 6: You have a file that contains the URLs you want to download? Use the ‘--input-file’:
```bash
wget --input-file file-names.txt
```

### Example 7: Add random delay between requests:

```bash
wget --wait=seconds --random-wait
```

### Example 8: Download only files with a specific regex

```bash
wget --accept-regex 'review/.*\.pdf'
```

great resource:
https://www.gnu.org/software/wget/manual/html_node/Advanced-Usage.html
