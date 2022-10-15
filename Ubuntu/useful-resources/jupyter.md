<!--ts-->
   * [jupyter](#jupyter)
      * [Jupyter lab setup project steps](#jupyter-lab-setup-project-steps)
      * [Some useful tips](#some-useful-tips)
         * [Jupiter](#jupiter)
      * [Useful hotkeys in Jupyter](#useful-hotkeys-in-jupyter)
         * [Magic Commands in junyper notebook](#magic-commands-in-junyper-notebook)
      * [Setting up jupyter](#setting-up-jupyter)
      * [Jupyter notebook extensions](#jupyter-notebook-extensions)
      * [Install jupyterlab extension:](#install-jupyterlab-extension)
      * [Install specific version of jupyterlab extension:](#install-specific-version-of-jupyterlab-extension)
      * [Clean all output cells in jupter notebook:](#clean-all-output-cells-in-jupter-notebook)
      * [Convert jupyter notebook to python file](#convert-jupyter-notebook-to-python-file)
      * [Debug jupyter notebook](#debug-jupyter-notebook)
      * [How to create table of content in Jupyter notebook?](#how-to-create-table-of-content-in-jupyter-notebook)
      * [Controlling the verbosity of the stack trace during debugging process](#controlling-the-verbosity-of-the-stack-trace-during-debugging-process)
      * [Timing code](#timing-code)
      * [Jupyter Lab](#jupyter-lab)
      * [Collection of Tips](#collection-of-tips)
      * [Enrich your jupyter layout](#enrich-your-jupyter-layout)

<!-- Added by: gil_diy, at: Tue 13 Sep 2022 19:57:49 IDT -->

<!--te-->

# jupyter

## Jupyter lab setup project steps

* **Step 1:** Install jupyter lab by entering:
`pipenv install jupyterlab`

* **Step 2:** Activate the environment in current folder:
`pipenv shell`

* **Step 3:** Run
`jupyter lab`
Will open the browser with a server localhost:8080.

## Some useful tips

For evaluating data you can right click and open `New Console for Notebook`,
it will open an IPython (Interactive Python). there will be an autocomplete option in case you press `tab`.


### Jupiter

Description | command
------------------------------------|-----
Run | **jupyter notebook**
Shutdown | **jupyter notebook stop**
Shift+Enter | Runs the code or markdown on a cell
Shift+tab | Read Documentation
Up Arrow+Down Arrow |  Toggle across cells
b | Create new cell
0+0 | Reset Kernel

[Shortcuts and tricks](https://nbviewer.jupyter.org/github/fastai/course-v3/blob/master/nbs/dl1/00_notebook_tutorial.ipynb)

## Useful hotkeys in Jupyter

Read about docstrings in python!!!!!

Description | Hotkey
------------|-----
 Show the documentation on a function while cursor appears on the function  | shift + tab



### Magic Commands in junyper notebook

Description | command
------------------------------------|-----
Run one single bash command | use `!` (an exclamation mark) before the command
Run many bash commands | use `%%bash` before the list of commands you entered in the cell
list all magic commands which can be run in a notebook | %lsmagic
import matplotlib | %matplotlib inline
Render the entire cell to html directly | %%HTML
Measure time of it takes to execute command | %%timeit

## Setting up jupyter 

```bash
pipenv install jupyter notebook jupyter_contrib_nbextensions
```
## Jupyter notebook extensions

For adding snippets and boilerpoints:

[Link](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/snippets_menu/readme.html)

## Install jupyterlab extension:

```python
jupyter labextension install <my-extension>
```

## Install specific version of jupyterlab extension:
```python
jupyter labextension install my-extension@1.2.3
```


## Clean all output cells in jupter notebook:
```python
jupyter nbconvert --clear-output --inplace my_notebook.ipynb
```

## Convert jupyter notebook to python file

```bash
jupyter nbconvert --output-dir='./<output-dir>' --to python notebooks/spotify_client.ipynb 
```

## Debug jupyter notebook

Write:

```python
pdb.set_trace()
```
to set a breakpoint in the specific line you want to start debugging.

There are many more available commands for interactive debugging than we've listed here; the following table contains a description of some of the more common and useful ones:

| Command         |  Description                                                |
|-----------------|-------------------------------------------------------------|
| ``l(ist)``      | Show the current location in the file                       |
| ``c(ontinue)``  | Quit the debugger, continue in the program                  |
| ``n(ext)``      | Go to the next step of the program                          |
| ``s(tep)``      | Step into a subroutine                                      |
| ``p(rint)``     | Print variables, variable value. i.e `p my_len`             |
| ``u(p)``        | Go up the call stack for figuring out what caused the error |
| ``d(own)``      | Go down again the call stack                                |
| ``<enter>``     | Repeat the previous command                                 |
| ``r(eturn)``    | Return out of a subroutine                                  |
| ``q(uit)``      | Quit the debugger and the program                           |
| ``h(elp)``      | Show a list of commands, or find help on a specific command |

For more information, use the ``help`` command in the debugger, or take a look at ``ipdb``'s [online documentation](https://github.com/gotcha/ipdb).

[Link](https://colab.research.google.com/github/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/01.06-Errors-and-Debugging.ipynb)

[explanantion how to debug in jupyter notebook](https://youtu.be/Z0ssNAbe81M?list=PLfYUBJiXbdtTttBGq-u2zeY1OTjs5e-Ia&t=6190)


## How to create table of content in Jupyter notebook?

[Link](https://moonbooks.org/Articles/How-to-create-a-table-of-contents-in-a-jupyter-notebook-/)

## Controlling the verbosity of the stack trace during debugging process

'%xmode' takes a single argument, the mode, and there are three possibilities:

* Plain -   is more compact and gives less information:
* Context - is the default
* Verbose -  adds some extra information, including the arguments to any functions that are called

To move to a different verbosity mode of the stack trace, just enter:
```python
%xmode Verbose
```

## Timing code

[Link](https://colab.research.google.com/github/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/01.07-Timing-and-Profiling.ipynb#scrollTo=0AGQSHqH5Qr1)


## Jupyter Lab

### Jupyter lab modify font

[Link](https://towardsdatascience.com/jupyterlab-2-0-edd4155ab897)



[](https://stackoverflow.com/a/54520440/1305700)


## Collection of Tips

[Link](https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/)

## Enrich your jupyter layout
https://towardsdatascience.com/enrich-your-jupyter-notebook-with-these-tips-55c8ead25255

## How to export the jupyter notebook?


[Nicely written here](https://towardsdatascience.com/jupyter-notebook-as-a-product-dc9d1c138e3a)