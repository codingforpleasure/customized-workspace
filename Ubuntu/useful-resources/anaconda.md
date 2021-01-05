<!--ts-->
   * [Anaconda](#anaconda)
      * [Creating environment](#creating-environment)
      * [Creating environment with specific python version](#creating-environment-with-specific-python-version)
      * [Removing environment](#removing-environment)
      * [Activating an environment](#activating-an-environment)
      * [Deactivating an environment](#deactivating-an-environment)
      * [Determining your current environment](#determining-your-current-environment)
      * [Viewing a list of your environments](#viewing-a-list-of-your-environments)
      * [Viewing a list of the packages in an environment](#viewing-a-list-of-the-packages-in-an-environment)
      * [Installing packages in the active environment](#installing-packages-in-the-active-environment)
      * [Get all information about an active environemnt](#get-all-information-about-an-active-environemnt)
      * [Get the location of all enviroments](#get-the-location-of-all-enviroments)
      * [Search for package](#search-for-package)
      * [Add extentions to your jupyter notebook](#add-extentions-to-your-jupyter-notebook)
      * [References](#references)

<!-- Added by: gil_diy, at: 2020-07-06T15:40+03:00 -->

<!--te-->
# Anaconda

## Creating environment
```bash
conda create --name my_environment_name
```

* comment:
The environment is created in `~/envs`

## Creating environment with specific python version

To see a list of available python versions first, type:

`conda search "^python$"`

```python
conda create -n my_environment_name python=3.6.9
```

## Removing environment

```bash
conda env remove -n env_name
```

## Activating an environment

```bash
conda activate <environment-name>
```

## Deactivating an environment
```bash
conda deactivate
```

## Determining your current environment

```bash
conda info --envs
```


## Viewing a list of your environments
```bash
conda env list
```


## Viewing a list of the packages in an environment

Assuming the environment is activated:

```bash
conda list
```

## Installing packages in the active environment

```bash
conda install <package-name>
```

Installing **specific version:**

```bash
conda install <package-name>=1.5.1
```

## Installing list of packages for the active environemnt:

```bash
conda env update --file more_tools.yml
```

The file `more_tools.yml` holds:

```
dependencies:
    - jupyter
    - scikit-learn
    - scipy
    - pandas
    - pandas-datareader
    - matplotlib
    - pillow
    - tqdm
    - requests
    - h5py
    - pyyaml
    - flask
    - boto3
    - pip:
        - bayesian-optimization
        - gym
        - kaggle
```

## Removing packages in the active environment

```bash
conda remove <package-name>
```

## Get all information about an active environemnt

```bash
conda info
```

## Get the location of all enviroments
```bash
conda info --envs
```

## Search for package 
```bash
conda search <package>
```

## Add extentions to your jupyter notebook

```bash
conda install -c conda-forge jupyter_contrib_nbextensions
```

## Add Jupyter support to your new environment

```bash
conda install nb_conda
```

## References

[Link](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#deactivating-an-environment)