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