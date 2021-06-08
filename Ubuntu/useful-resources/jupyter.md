<!--ts-->
   * [jupyter](#jupyter)
      * [Jupyter lab setup project steps](#jupyter-lab-setup-project-steps)
      * [Some useful tips](#some-useful-tips)
         * [Jupiter](#jupiter)
      * [Useful hotkeys in Jupyter](#useful-hotkeys-in-jupyter)
            * [Magic Commands in junyper notebook](#magic-commands-in-junyper-notebook)
      * [Setting up jupyter](#setting-up-jupyter)
      * [Jupyter notebook extensions](#jupyter-notebook-extensions)
      * [debugging in jupyter notebook](#debugging-in-jupyter-notebook)
      * [Clean all output cells in jupter notebook:](#clean-all-output-cells-in-jupter-notebook)
      * [Convert jupyter notebook to python file](#convert-jupyter-notebook-to-python-file)
      * [Collection of Tips](#collection-of-tips)

<!-- Added by: gil_diy, at: Tue 08 Jun 2021 16:33:02 IDT -->

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
Up Arrow+Down Arrow |  Toggle across cells
b | Create new cell
0+0 | Reset Kernel

[Shortcuts and tricks](https://nbviewer.jupyter.org/github/fastai/course-v3/blob/master/nbs/dl1/00_notebook_tutorial.ipynb)

## Useful hotkeys in Jupyter

Read about docstrings in python!!!!!

Description | Hotkey
------------|-----
 Show the documentation on a function while cursor appears on the function  | shift + tab



#### Magic Commands in junyper notebook

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


## debugging in jupyter notebook

```python
pdb.set_trace()
```

[explanantion how to debug in jupyter notebook](https://youtu.be/Z0ssNAbe81M?list=PLfYUBJiXbdtTttBGq-u2zeY1OTjs5e-Ia&t=6190)


## Clean all output cells in jupter notebook:
```python
jupyter nbconvert --clear-output --inplace my_notebook.ipynb
```

## Convert jupyter notebook to python file

```bash
jupyter nbconvert --output-dir='./<output-dir>' --to python notebooks/spotify_client.ipynb 
```

## Collection of Tips

[Link](https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/)