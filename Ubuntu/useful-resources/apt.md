# Tips for Ubuntu's Advanced Packaging Tool (APT)

Over the years I have been using some Linux' distributions,

one of them is Ubuntu so here I have wrote down some tips & tricks
for using apt and debian package manager:


## Useful commands:

Purpose | command example
------------ | -------------
Installing package | apt-get install &lt;pkg name&gt;
Uninstalling package | apt-get remove &lt;pkg name&gt;
Get rid of left overs (config files) |  sudo apt-get --purge remove &lt;pkg name&gt;
Search for a package |  apt-cache search &lt;pkg name&gt;
Get more info about the package | apt-cache show &lt;pkg name&gt;
Add new personal package archive | add-apt-repository ppa:&lt;ppa-name&gt;
List all packages set to manual update | sudo apt-mark showmanual
List all packages set to auto update | sudo apt-mark showauto
List all packages on the system |  sudo dpkg --get-selections
List all files regarding a package |   dpkg -L &lt;pkg name&gt;
Find the a missing file to which package it belongs to | apt-file &lt;file-name&gt;
Get package dependencies | apt-cache rdepends &lt;pkg name&gt;
