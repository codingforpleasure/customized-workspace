<!--ts-->
   * [Optuna](#optuna)
      * [What are the Hyperparameters?](#what-are-the-hyperparameters)
      * [Hyperparameter Evolution](#hyperparameter-evolution)
      * [How to use Optuna with pytorch?](#how-to-use-optuna-with-pytorch)
      * [Hyperparameter Importances](#hyperparameter-importances)

<!-- Added by: gil_diy, at: Mon 08 Feb 2021 11:38:38 IST -->

<!--te-->
# Optuna	

Optuna is for hyperparameter tuning

[Link](https://youtu.be/P6NwZVl8ttc)

## What are the Hyperparameters?

Input:

* Augmentation method, order, magnitude? image size? image format? 

Network trainer:

* Batch size?
* Optimizer?
* Momentum?
* Learning rate schedule?

Detector model:

* Backbone architecture: VGG? Resnet? ResnetXt? MASNet?
* Number of Res Block?
* Kernel Size?
* Dropout size?
* Batch Normalization order? 
* Region propsal method?
* Number of FPN layers?

Suppression:

* Suppression method?
* Suppression threshold?

## Hyperparameter Evolution

* Not evolution hyperparameters
* Manually fidgeting with hyperparameters
* Grid search (The problem with gridsearch it's does not focus on areas of higher benefit)
* Using Optuna
 


## How to use Optuna with pytorch?

[Full Example](https://github.com/optuna/optuna/blob/master/examples/pytorch_simple.py)

```python
import optuna


def objective(trial):
	############## Your code here ##############
	n_layers = trails.suggest_int("n_layers",1,3)
	
	return evaluation_Score


study = optuna.create_study()
study.optimize(objective, n_trials = 10)
```

## Hyperparameter Importances