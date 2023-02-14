<!--ts-->
* [Tips for Sublime](#tips-for-sublime)
   * [Setting up working environment](#setting-up-working-environment)
   * [Writing plugins for sublime (Using python)](#writing-plugins-for-sublime-using-python)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Tue 14 Feb 2023 10:18:41 AM IST -->

<!--te-->

# Tips for Sublime


## Setting up working environment

* Key binding appears in the following path:
`~.config/sublime-text-3/Packages/User/**.sublime-keymap
`

* Snippets appears in the following path:

`/.config/sublime-text-3/Packages/User/my-snippets/**.sublime-snippet`




Purpose | command example
------------ | -------------
Multiediting | Ctrl + click on specific places with the mouse
Get markdown options | Ctrl+shift+p
Show console | `ctrl+\``
for Uppercase | Ctrl+k+u
for Lowercase | Ctrl+k+l


For debugging enter into the sublime's console:
sublime.log_commands(True)
For disable debugging mode enter in the command:
sublime.log_commands(False)
 All list of **packages** for **sublime** resides in:
```bash
ll ~/.config/sublime-text-3/Installed Packages
```


useful link:
https://medium.freecodecamp.org/a-guide-to-preserving-your-wrists-with-sublime-text-snippets-7541662a53f2


## Writing plugins for sublime (Using python)

[Great Refernce](https://docs.sublimetext.io/guide/extensibility/plugins/)