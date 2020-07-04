<!--ts-->
   * [Anaconda](#anaconda)
      * [Creating environment](#creating-environment)
      * [Activating an environment](#activating-an-environment)
      * [Deactivating an environment](#deactivating-an-environment)
      * [Determining your current environment](#determining-your-current-environment)
      * [Viewing a list of your environments](#viewing-a-list-of-your-environments)
      * [Viewing a list of the packages in an environment](#viewing-a-list-of-the-packages-in-an-environment)
      * [Installing packages in the active environment](#installing-packages-in-the-active-environment)
      * [References](#references)

<!-- Added by: gil_diy, at: 2020-07-04T13:45+03:00 -->

<!--te-->
# Anaconda

## Creating environment
```bash
conda create --name my_environment_name
```

* comment:
The environment is created in `~/envs`

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

## References

[Link](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#deactivating-an-environment)