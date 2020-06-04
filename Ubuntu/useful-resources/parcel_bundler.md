<!--ts-->
   * [Parcel a simple bundler](#parcel-a-simple-bundler)
      * [Steps:](#steps)

<!-- Added by: gil_diy, at: 2020-06-04T12:10+03:00 -->

<!--te-->

# Parcel a simple bundler

## Steps:

In your folder of the project you have just created, enter:
``
npm init -y
``


Run the command in the directory:

`npm i -D parcel-bundler`


In the file `package.json`
```bash
{
  "name": "parceltest",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "dev": "parcel src/index.html",   <-- I have added this line
    "prod":"parcel build src/index.html" <-- I have added this line
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "parcel-bundler": "^1.12.4"
  }
}
```

for running: 

`npm run dev `


[Reference](https://youtu.be/OK6akGZCC88)
