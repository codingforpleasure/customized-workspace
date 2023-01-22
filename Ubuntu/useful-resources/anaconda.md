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
   * [Export your active environment to a new file](#export-your-active-environment-to-a-new-file)
   * [Installing packages in the active environment](#installing-packages-in-the-active-environment)
   * [Installing list of packages for the active environemnt:](#installing-list-of-packages-for-the-active-environemnt)
   * [Create environment from requirements.yml](#create-environment-from-requirementsyml)
   * [Saving environment to a text file](#saving-environment-to-a-text-file)
   * [Create environment from a text file](#create-environment-from-a-text-file)
   * [Removing packages in the active environment](#removing-packages-in-the-active-environment)
   * [Get all information about an active environemnt](#get-all-information-about-an-active-environemnt)
   * [Get the location of all enviroments](#get-the-location-of-all-enviroments)
   * [Search for package](#search-for-package)
   * [Search for package in specific channel](#search-for-package-in-specific-channel)
   * [Add extentions to your jupyter notebook](#add-extentions-to-your-jupyter-notebook)
   * [Add Jupyter support to your new environment](#add-jupyter-support-to-your-new-environment)
   * [Registering new kernel into the environemnt](#registering-new-kernel-into-the-environemnt)
   * [View available kernels in environment](#view-available-kernels-in-environment)
   * [Removing kernel from the environment](#removing-kernel-from-the-environment)
   * [Specifying version numbers](#specifying-version-numbers)
   * [Clean the pkgs directory](#clean-the-pkgs-directory)
   * [References](#references)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 22 Jan 2023 11:14:26 AM IST -->

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

By default all environments are located in:
`/home/gil_diy/miniconda3/envs`

## Removing environment

```bash
conda env remove -n env_name
```

By default all environments are located in:
`/home/gil_diy/miniconda3/envs`

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

## Export your active environment to a new file

First activate the environment to export: `conda activate <myenv>`

```bash
conda env export > environment.yml
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

## Create environment from requirements.yml

```bash
conda env create -n review_object_detection_metrics --file environment.yml
```

## Saving environment to a text file

```bash
conda list --explicit > bio-env.txt
```

## Create environment from a text file
```bash
conda env create --name myenv --file bio-env.txt
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

## Search for package in specific channel
```bash
conda search -c <channel-name> <package-name>
```

## Add extentions to your jupyter notebook
```bash
conda install jupyter -y
```


```bash
conda install nb_conda
```

```bash
conda install -c conda-forge jupyter_contrib_nbextensions
```

## Add Jupyter support to your new environment



## Registering new kernel into the environemnt

The following command registers your pytorch environment (make sure you "conda activate" your new pytorch envorinment)


```bash
python -m ipykernel install --user --name pytorch --display-name "pytorch 3.8 for RTX 3090"
```


## View available kernels in environment

```bash
jupyter kernelspec list
```

## Removing kernel from the environment


```bash
jupyter kernelspec list
```
```bash
jupyter kernelspec uninstall <kernel-to-remove>
```

## Specifying version numbers

Constraint type | Specification | Result
------------|------------------|---------
 Fuzzy | numpy=1.11 |  1.11.0 , 1.11.1 , 1.11.2 , 1.11.18 etc
 Exact | numpy==1.11 | 1.11.0
 Greater than or equal to | "numpy>=1.11" | 11.1.0 or higher
 OR | "numpy=1.11.1|1.11.3" | 1..11.1, 1.11.3
 AND | "numpy>=1.8,<2" | 1.8, 1.9, not 2.0

**NOTE:** Quotation marks must be used when your specification contains a space or any of these characters: > < |

## Clean the pkgs directory

It might reach 90 GB!!

```
/home/gil_diy/miniconda3/pkgs
```

The pkgs directory is conda's package cache. I would strongly recommend not to delete packages there manually. 
Doing so can break environments that use one of these packages. let conda decide which of the packages are safe to delete.

```bash
conda clean -p
````

## References

[Link](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#deactivating-an-environment)