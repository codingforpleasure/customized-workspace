<!--ts-->
  * [The type of package managers in python:](#the-type-of-package-managers-in-python)
     * [pip](#pip)
     * [virtual env](#virtual-env)
        * [how to install?](#how-to-install)
        * [useful commands](#useful-commands)
     * [Anaconda](#anaconda)
        * [useful commands](#useful-commands-1)
     * [pyenv](#pyenv)
     * [pipenv](#pipenv)
        * [how to install?](#how-to-install-1)
        * [useful commands](#useful-commands-2)

<!-- Added by: gil_diy, at: 2018-07-31T22:42+03:00 -->

<!--te-->


## The type of package managers in python:
- [x] pip
- [x] virtual env
- [x] Anaconda
- [x] pypenv
- [x] pipenv


envpip install -r requirements.txt

Virtualenv or Anaconda serve the same aim.

```bash
pip install virtualenv
```

For installing pip packages in isolated manner,
for getting full control which package to install for each environment you create. Each project has different dependencies, therefore we need to create environment for each project.


For example:
one environment for `Web Development` with one set of libraries:
Flask
requests
Jinja2
SQLAlchemy
MarkupSafe


and a second environment for `Data Science` with different set of libraries :
tensorflow
jupyter
matplotlib
numpy
pandas

Creating environment for specific purposes.


Those two don't get well together (Anaconda, Virtualenv), therefore:
`pyenv` tries to solve this issue.
it sits on top of those two,

### pip

Description | command
-------------|-------------
List packages on your global site packages|  **pip list**
Install new package|  **pip install &lt;package-name&gt;**


will install django to my system, a much better approach will be to use virtual env for this project.

### virtual env
separate different environments for different projects

#### how to install?
```bash
pip install virtualenv
```
#### useful commands

Description | command
-------------|-------------
Create new virtualenv|  **virtualenv <your new venv name>**
Create a new virtualenv with specifying python version|**virtualenv -p /usr/bin/python2.6 <your new venv name>**
Enter into your new python environment| **source &lt;your new venv&gt;/bin/activate**
Get Python version in the current environment| **which python**
Get Pip version in the current environment| **which pip**
List packages in your environment | **pip list**
Export all those packages (and versions) to another environment | **pip freeze --local > requirements.txt**
Exit the active environment | **deactivate**


### Anaconda

Anaconda (conda is the package manager)

#### useful commands

Description | command
-------------|-------------
Create new virtualenv | **conda create --name &lt;new env-name&gt;**
Enter into your new python environment |**conda activate &lt;env-name&gt;**
Install a package |**conda install &lt;package name&gt;**

### pyenv

### pipenv
You don't need to manage your virtual environment. it will take care for you.
#### how to install?
```bash
sudo pip install pipenv
```
#### useful commands

Description | command
-------------|-------------
Install a package|  **pipenv install** &lt;package-name&gt;
Uninstall a package|  **pipenv uninstall** &lt;package-name&gt;
Generate a lockfile | **pipenv lock**
Run a given command from the virtualenv, with any arguments forwarded|   **pipenv run** python manage.py runserver
Spawn a shell with the virtualenv activated|   **pipenv shell**
Locate the project| **pipenv --where**
Locate the virtualenv| **pipenv --venv**
Locate the Python interpreter | **pipenv --py**
Checks if all dependencies are satisfied| **pipenv check**
Initialize a Python 2 virtual environment | **pipenv --two**
Initialize a Python 3 virtual environment | **pipenv --three**
Print a pretty graph of all your installed dependencies | **pipenv graph**

It will automatically create a virtual env for this project,
and after setting things up:

**Pipfile** - holds the packages installed for this project, can easily modify (_human readable_)

**Pipfile.lock** - you can easily see the package dependencies, and all hashes

it will enter into the virtual environment
