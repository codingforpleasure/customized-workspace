Table of Contents
=================

<!--ts-->
   * [Table of Contents](#table-of-contents)
      * [The type of package managers in python:](#the-type-of-package-managers-in-python)
         * [pip (Python Package Manager)](#pip-python-package-manager)
         * [virtualenv (Python Environment Manager)](#virtualenv-python-environment-manager)
            * [how to install?](#how-to-install)
            * [useful commands](#useful-commands)
         * [Anaconda (Package Manager   Environment Manager   Additional Scientific Libraries)](#anaconda-package-manager--environment-manager--additional-scientific-libraries)
            * [useful commands](#useful-commands-1)
         * [pyenv (Python Version Manager)](#pyenv-python-version-manager)
         * [pipenv (Package Manager + Environment Manager + Python Version Manager) <g-emoji class="g-emoji" alias=" 1" fallback-src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f44c.png">👍</g-emoji>](#pipenv-package-manager--environment-manager--python-version-manager-thumbsup)
            * [how to install?](#how-to-install-1)
            * [useful commands](#useful-commands-2)

<!-- Added by: gil_diy, at: 2018-08-01T11:09+03:00 -->

<!--te-->



## The type of package managers in python:
- [x] pip
- [x] virtual env
- [x] Anaconda
- [x] pypenv
- [x] pipenv :thumbsup:

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


### pip (Python Package Manager)

Description | command
-------------|-------------
List packages on your global site packages|  **pip list**
Install new package|  **pip install** &lt;package-name&gt;
Install new package with specific version |**pip install** &lt;package-name&gt;**==**&lt;version number&gt;
Install list of requirements | **pip install -r** requirements.txt
Uninstall package|  **pip uninstall** &lt;package-name&gt;
Export all those packages (and versions) to another environment |  **pip freeze** > requirements.txt

for example:
```bash
$ pip install django
```
will install django to my system, a much better approach will be to use virtual env for a project.

comment: usually you would have some pip versions installed on your system, make sure you use the correct one. I prefer using the latest one on my system (`pip3.6`).

### virtualenv (Python Environment Manager)
separate different environments for different projects

 The basic problem being addressed is one of dependencies and versions, and indirectly permissions. Imagine you have an application that needs version 1 of LibFoo, but another application requires version 2. How can you use both these applications? If you install everything into /usr/lib/python2.7/site-packages (or whatever your platform’s standard location is), it’s easy to end up in a situation where you unintentionally upgrade an application that shouldn’t be upgraded.

#### how to install?
```bash
$ pip install virtualenv
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


### Anaconda (Package Manager + Environment Manager + Additional Scientific Libraries)


Virtualenv or Anaconda serve the same aim, although brings more to the table.


#### useful commands

Description | command
-------------|-------------
Create new virtualenv | **conda create --name &lt;new env-name&gt;**
Enter into your new python environment |**conda activate &lt;env-name&gt;**
Install a package |**conda install &lt;package name&gt;**

### pyenv (Python Version Manager)
pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.
If you need to use different versions of python, pyenv lets you manage this easily

Those two don't get well together (Anaconda, Virtualenv), therefore:
`pyenv` tries to solve this issue. it sits on top of those two.

### pipenv (Package Manager + Environment Manager + Python Version Manager) :thumbsup:
You don't need to manage your virtual environment. it will take care for you.
#### how to install?
```bash
$ sudo pip install pipenv
```
#### useful commands

Description | command
-------------|-------------
Install a package|  **pipenv install** &lt;package-name&gt;
Uninstall a package|  **pipenv uninstall** &lt;package-name&gt;
Generate a lockfile | **pipenv lock**
Run a given command from the virtualenv, with any arguments forwarded|   **pipenv run** python manage.py runserver
Spawn a shell with the virtualenv activated|   **pipenv shell**
Locate the project| **pipenv `--`where**
Locate the virtualenv| **pipenv `--`venv**
Locate the Python interpreter | **pipenv `--`py**
Checks if all dependencies are satisfied| **pipenv check**
Initialize a Python 2 virtual environment | **pipenv `--`two**
Initialize a Python 3 virtual environment | **pipenv `--`three**
Print a pretty graph of all your installed dependencies | **pipenv graph**

It will automatically create a virtual env for this project,
and after setting things up:

**Pipfile** - holds the packages installed for this project, can easily modify (_human readable_)

**Pipfile.lock** - you can easily see the package dependencies, and all hashes

it will enter into the virtual environment
