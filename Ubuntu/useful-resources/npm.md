<!--ts-->
   * [NPM](#npm)
      * [Package.json](#packagejson)
      * [Versioning](#versioning)
      * [Useful packages](#useful-packages)
         * [Prettier](#prettier)
            * [Setuping](#setuping)
            * [Run prettier](#run-prettier)
            * [Run scripts for an app](#run-scripts-for-an-app)
         * [ESLint](#eslint)
            * [Setuping](#setuping-1)

<!-- Added by: gil_diy, at: 2019-01-10T05:45+02:00 -->

<!--te-->


# NPM

Node Package manager,
javascript packages manager.

sudo npm i -g create-react-app@1.5.2

npm start


Description | command
------------|-----
| `npm init`
Install specific package for production| `npm install <package-name> --save`
Install specific package for development| `npm install <package-name> --save-dev`
Install all package dependencies listed in `Package.json`| `npm install`
Install specific package version| `npm install <package-name>@<version>`
Install globally a module (not locally to only this app) | `npm install -g  <package-name>`
Remove package | `npm uninstall <package-name> --save-dev`
                | `npm remove <package-name> --save-dev`
Retrieving path for global packages | `npm root -g`


Comments:
* All local packages goes to the `node_modules` folder

## Package.json
* Manifest file with app info
* List dependency (name & version)
* Specify if versions should be updated
* Create NPM scripts
* Easily create with `npm init`



## Versioning

major-number.minor-number.path-number

`^` - **Will install the latest minor version (latest version of 4)** :
```bash
"dependencies":{
	"lodash" : "^4.17.4"
}
```


`~` - **Will update the patch version, the major and minor version will remain the same** :
```bash
"dependencies":{
	"lodash" : "~4.17.4"
}
```



`*` - **Install the absolute latest version** :
```bash
"dependencies":{
	"lodash" : *
}
```


## Useful packages

### Prettier
#### Setuping
`npm install -D prettier`

`-D`: means dev dependecies
prettier forces to format all code (json, js, html, css files) to a specific format
(takes care of all indetations and quotation mark for you).

For doing this automatic in your vscode (prettier running in the background):

1. Install in vscode the plugin `prettier`
2. In User Settings:<br>
`"prettier.requireConfig" : true`<br>
`"editor.formatOnSave" : true`

3. create a file `.prettierrc` the same level as Packages.json , which it's content is: `{}`

#### Run prettier
```bash
npx prettier bla.js
```

* To overwrite the file

```bash
npx prettier bla.js --write
```



#### Run scripts for an app

You should refer for the script in `package.json`
in the scripts section.

and then afterwards just run from the shell the command for invoking the script:

`npm run <script-name>`


### ESLint

Responsible for linting your code:
#### Setuping

1. create a file `.eslintrc` the same level as Packages.json , which it's content is:

```bash
{
	"extends":[
		"eslint:recommended",
		"prettier",
		"prettier/react"
	],
	"parserOptions":{
		"ecmaVersion": 2018,
		"sourceType": "module",
		"ecmaFeatures": {
			"jax": true
		}
	},
	"env":{
		"es6": true,
		"browser": true,
		"node": true
	}
}
```
2. Install necessary packages
`npm install -D eslint-config-prettier eslint-plugin-prettier`
