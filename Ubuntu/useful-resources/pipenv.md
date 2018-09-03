# pipenv (Package Manager + Environment Manager + Python Version Manager) :thumbsup:
You don't need to manage your virtual environment. it will take care for you.
## how to install?
```bash
$ sudo pip install pipenv
```
## useful commands

Description | command
-------------|-------------
Install a package|  **pipenv install** &lt;package-name&gt;
Uninstall a package|  **pipenv uninstall** &lt;package-name&gt;
Generate a lockfile | **pipenv lock**
Run a given command from the virtualenv, with any arguments forwarded|   **pipenv run python** manage.py runserver
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

If you are using pycharm (2018), it's supports pipenv right out of the box,
BUT it's more recommended to install your packages from the shell with pipenv,
since I have noticed sometimes Pycharm fails.
