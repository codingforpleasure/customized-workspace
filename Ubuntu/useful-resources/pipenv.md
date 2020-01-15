<!--ts-->
   * [pipenv (Package Manager   Environment Manager   Python Version Manager) <g-emoji class="g-emoji" alias=" 1" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f44d.png">👍</g-emoji>](#pipenv-package-manager--environment-manager--python-version-manager-thumbsup)
      * [how to install?](#how-to-install)
      * [useful commands](#useful-commands)
   * [Virtualenv](#virtualenv)
      * [useful commands](#useful-commands-1)

<!-- Added by: gil_diy, at: 2020-01-15T09:16+02:00 -->

<!--te-->


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
Install packages in case you have only `requirements.txt` file available | **pipenv install -r path/to/requirements.txt**
Uninstall a package|  **pipenv uninstall** &lt;package-name&gt;
Generate a lockfile | **pipenv lock**
If stuck on `Locking packages dependecies` |**pipenv lock --clear --verbose**
Run a given command from the virtualenv, with any arguments forwarded|   **pipenv run python** manage.py runserver
Spawn a shell with the virtualenv activated|   **pipenv shell**
Locate the project| **pipenv `--`where**
Locate the virtualenv| **pipenv `--`venv**
Locate the Python interpreter | **pipenv `--`py**
Checks if all dependencies are satisfied| **pipenv check**
Initialize a Python 2 virtual environment | **pipenv `--`two**
Initialize a Python 3 virtual environment | **pipenv `--`three**
Print a pretty graph of all your installed dependencies | **pipenv graph**
Upgrade pipenv | **pip install `--`upgrade pipenv**
Install

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
Install a package|  **python3 -m pip install -U** matplotlib
Create virtuak env |  **virtualenv my_env**
Activate virtual env |  **source my_env/bin/activate**
Deactivate | **source my_env/bin/deactivate**
