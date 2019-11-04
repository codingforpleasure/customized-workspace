<!--ts-->
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


