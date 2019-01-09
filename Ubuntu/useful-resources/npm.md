<!--ts-->
<!--te-->


# NPM

Node Package manager,
javascript packages manager.

sudo npm i -g create-react-app@1.5.2

npm start


Description | command
------------|-----
Install specific package for production| `npm install <package-name> --save`
Install specific package for development| `npm install <package-name> --save-dev`
Install all package dependencies listed in `Package.json`| `npm install`
Install specific package version| `npm install <package-name>@<version>`
Remove package | `npm uninstall <package-name> --save-dev`
                | `npm remove <package-name> --save-dev`



## Package.json
* Manifest file with app info
* List dependency (name & version)
* Specify if versions should be updated
* Create NPM scripts
* Easily create with `npm init`
