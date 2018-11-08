<!--ts-->
<!--te-->

Used to convert between different character encodings. "It can convert from any of these encodings to any other, through Unicode conversion.

**Useful especially when transfering hebrew text from windows to Linux:**


So here is an example of converting from **ISO-8859-8** to **UTF-8**:

```python
iconv -f ISO-8859-8 -t UTF-8 <   <input_file>    >     <output_file>
```

remark (1): **ISO-8859-8** is characters set in Hebrew.

remark (2): For listing all character encodings just type: **iconv -l**
