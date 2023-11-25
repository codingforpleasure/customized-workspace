<!--ts-->
- [pipenv (Package Manager + Environment Manager + Python Version Manager)](#pipenv-package-manager--environment-manager--python-version-manager)
  - [how to install?](#how-to-install)
  - [Make sure the correct virtualenv is running from your python file:](#make-sure-the-correct-virtualenv-is-running-from-your-python-file)
  - [useful commands](#useful-commands)
  - [Create a virtual environment if one doesn’t already exist](#create-a-virtual-environment-if-one-doesnt-already-exist)
  - [Install package](#install-package)
  - [Install specific package version](#install-specific-package-version)
  - [Install something directly from a version control system (VCS)](#install-something-directly-from-a-version-control-system-vcs)
  - [Create/update your Pipfile.lock](#createupdate-your-pipfilelock)
  - [Completely wipe all the installed packages from your virtual environment](#completely-wipe-all-the-installed-packages-from-your-virtual-environment)
  - [Where your virtual environment is](#where-your-virtual-environment-is)
  - [Find out where your project home is](#find-out-where-your-project-home-is)
- [Pip](#pip)
- [Virtualenv](#virtualenv)
  - [useful commands](#useful-commands-1)
  - [Pip commands](#pip-commands)
    - [Remove all packages installed by pip](#remove-all-packages-installed-by-pip)
  - [Pip vs Anaconda](#pip-vs-anaconda)
  - [Anaconda](#anaconda)
  - [Pip cache folder](#pip-cache-folder)
  - [Pipenv cache folder](#pipenv-cache-folder)
  - [Pip cache folder](#pip-cache-folder-1)
  - [Libraries on local hard-drive:](#libraries-on-local-hard-drive)
  - [Reference](#reference)

<!-- Added by: gil_diy, at: Thu 09 Jun 2022 11:34:01 IDT -->

<!--te-->


# pipenv (Package Manager + Environment Manager + Python Version Manager)
You don't need to manage your virtual environment. it will take care for you.
## how to install?
```bash
$ sudo pip install pipenv
```
## Make sure the correct virtualenv is running from your python file:

```
import sys
import os

print(f'Python Executable: {sys.executable}')
print(f'Python Version: {sys.version}')
print(f'Virtualenv: {os.getenv("VIRTUAL_ENV")}')
```

## useful commands

Description | command
-------------|-------------
Create a new virtual environment and generate a Pipfile|  **pipenv install**
Activate the virtual environment|   **pipenv shell**
Install a package|  **pipenv install** &lt;package-name&gt;
Install a package from a local file|  **pipenv install ./opencv_python-4.5.whl**
if the virtualenv is already activated, you can also use Install packages from Pipfile | **pipenv sync**
Export requriments file | pipenv run pip freeze > requirements.txt
Install packages in case you have only `requirements.txt` file available | **pipenv install -r path/to/requirements.txt**
Uninstall a package|  **pipenv uninstall** &lt;package-name&gt;
Generate a lockfile | **pipenv lock**
If stuck on `Locking packages dependecies` |**pipenv lock --clear --verbose**
Run a given command from the virtualenv, with any arguments forwarded|   **pipenv run python** manage.py runserver
Locate the project| **pipenv `--`where**
Locate the virtualenv| **pipenv `--`venv**
Locate the Python interpreter | **pipenv `--`py**
Given Pipfile install all requirements in directory | **pipenv sync**
Checks if all dependencies are satisfied| **pipenv check**
Initialize a Python 2 virtual environment | **pipenv `--`two**
Initialize a Python 3 virtual environment | **pipenv `--`three**
Initialize virtual environment with specific version of python | **pipenv install `--`python 3.8**
Print a pretty graph of all your installed dependencies | **pipenv graph**
Upgrade pipenv | **pip install `--`upgrade pipenv**


It will automatically create a virtual env for this project,
and after setting things up:

**Pipfile** - holds the packages installed for this project, can easily modify (_human readable_)

**Pipfile.lock** - you can easily see the package dependencies, and all hashes

If you are using pycharm (2018), it's supports pipenv right out of the box,
BUT it's more recommended to install your packages from the shell with pipenv,
since I have noticed sometimes Pycharm fails.

It is recommended to update pipenv for once in a while:
```bash
pip install --upgrade pipenv
```
## Create a virtual environment if one doesn’t already exist

```bash
pipenv run pip freeze > requirements.txt
```

## Install package

```bash
pipenv install numpy
```

## Install specific package version

```bash
pipenv install flask==0.12.1
```

## Install something directly from a version control system (VCS)

```bash
pipenv install -e git+https://github.com/requests/requests.git#egg=<fill here>
```

* To determine the egg: look up the name argument to the setup() function in the package's setup.py

## Create/update your Pipfile.lock

```bash
pipenv lock
```

## Completely wipe all the installed packages from your virtual environment

```bash
pipenv uninstall --all
```

or 

```bash
pip uninstall -y -r <(pip freeze)
```

## Where your virtual environment is

```bash
pipenv --venv
```

## Find out where your project home is

```bash
pipenv --where
```

# Pip



# Virtualenv

```bash
cd $MY_PROJECT_DIRECTORY
virtualenv my_env
```

Now every time you want to activate
the environment, just type:
```bash
cd $MY_PROJECT_DIRECTORY
source my_env/bin/activate
```

To deactivate just type:
```bash
cd $MY_PROJECT_DIRECTORY
source my_env/bin/deactivate
```

Installing packages:
```bash
python3 -m pip install -U matplotlib numpy pandas scipy scikit-learn
```

## useful commands

Make sure you're in the correct directory of the project:
```bash
cd $MY_PROJECT_DIRECTORY &&
```
and then:

Description | command
-------------|-------------
Create virtuak env |  **virtualenv my_env**
Activate virtual env |  **source my_env/bin/activate**
Install a package|  **python3 -m pip install -U** matplotlib
Deactivate | **source my_env/bin/deactivate**


## Pip commands 

Description | command
-------------|-------------
Create a new virtual environment and generate a Pipfile|  
Activate the virtual environment| in the directory with venv run: `source venv/bin/activate`
Making sure you have activate the virtual envionment | `which python`
Install a package |  `pip install requests`
Install a package from a local file | `pip install requests-2.22.0-py2.py3-none-any.whl`
Install package from a Git repository | `pip install git+https://github.com/psf/requests.git`
search for packages mentioning “term” | `pip search <term>`
Capture all currently installed versions in a text file | `pip freeze > requirements.txt`
Install packages from a requirements file |`pip install -r requirements.txt`
if the virtualenv is already activated, you can also use Install packages from Pipfile | 
Install packages in case you have only `requirements.txt` file available | requirements.txt**
Uninstall a package|  
Generate a lockfile | 
If stuck on `Locking packages dependecies` |
Run a given command from the virtualenv, with any arguments forwarded| 
Locate the project| 
Locate the virtualenv| 
Locate the Python interpreter | 
Checks if all dependencies are satisfied| 
Initialize a Python 2 virtual environment | 
Initialize a Python 3 virtual environment | 
Initialize virtual environment with specific version of python | 
Print a pretty graph of all your installed dependencies | 
Upgrade pipenv | 


### Remove all packages installed by pip

```bash
pip uninstall -y -r <(pip freeze) 
```


## Pip vs Anaconda
Description | Command
------------|-----
pip search <package-name> | conda search <package-name>
pip install <package-name> | conda install <package-name>
pip search <package-name> -upgrade | conda update python
pip list -v | conda list



## Anaconda
Description | Command
------------|-----
Activate | conda activate `<my_environment>`
Install  in specific environment | conda install -c pytorch -c fastai fastai


Open notebook with:

`jupyter-notebook <notebook-name>`


## Pip cache folder

```bash
pip cache dir
```

Install and skip cache directory:
```bash
pip3 install --no-cache-dir <package-name>
```

## Pipenv cache folder

In my workstation it's: `/home/gil_diy/.cache/pipenv`

## Pip cache folder


## Libraries on local hard-drive:

`/home/gil_diy/.local/share/virtualenvs`


## Reference

[Link](https://realpython.com/pipenv-guide/)





