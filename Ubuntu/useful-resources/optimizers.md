<!--ts-->
   * [Optimizers](#optimizers)
      * [Optimizers](#optimizers-1)
         * [Gradient Descent](#gradient-descent)
         * [Stochastic Gradient Descent (SGD)](#stochastic-gradient-descent-sgd)
         * [Stochastic Gradient Descent with mini-batches](#stochastic-gradient-descent-with-mini-batches)
         * [SGD With momentum (with Exponentially Weighted Moving Average)](#sgd-with-momentum-with-exponentially-weighted-moving-average)
         * [Adagradient (Adaptive gradient)](#adagradient-adaptive-gradient)
            * [Diagonal AdaGrad (this version is the one used in practice)](#diagonal-adagrad-this-version-is-the-one-used-in-practice)
         * [RMSprop (Root mean square prop)](#rmsprop-root-mean-square-prop)
         * [Adam (Adaptive Moment Estimation)](#adam-adaptive-moment-estimation)
         * [LBFGS](#lbfgs)
   * [References](#references)

<!-- Added by: gil_diy, at: Mon 07 Feb 2022 10:31:02 IST -->

<!--te-->

# Optimizers

[Pytorch optimizers](https://pytorch.org/docs/1.9.1/optim.html)

## Optimizers 

[Link](file:///home/gil_diy/my_documentation_helper/opencv/opencv.html)

### Gradient Descent

### Stochastic Gradient Descent (SGD)

SGD adds some randomness into traditional gradient descent

Stochastic Gradient Descent is a common method for optimization. It is conceptually simple and can often be efficiently implemented. However, it features a parameter (the step size) that needs to be manually tuned

Drawbacks:

* **standard stochastic subgradient** methods mainly follow a predetermined procedural scheme that **disregards the characteristics of the data being observed**.

### Stochastic Gradient Descent with mini-batches

### SGD With momentum (with Exponentially Weighted Moving Average)

momentum helps to accelerate the process of SGD.

The above shows gradient descent with momentum term, where the `lr` is actually fixed for all parameters on different dimension. 

### Adagradient (Adaptive gradient)

* Adagradient is one of the options to automate tuning for the step size.

* **AdaGrad’s algorithms dynamically incorporate knowledge of the geometry of the data observed in earlier iterations to perform more informative gradient-based learning** .


* The learning rate is adapted component-wise to the parameters by incorporating knowledge of past observations.

* It performs larger updates (e.g. high learning rates) for those parameters that are related to infrequent features.

* Smaller updates (low learning rates) for frequent one.


**Advantages of Using AdaGrad:**

1) It eliminates the need to manually tune the learning rate

2) Convergence is faster and more reliable – than simple SGD when the scaling of the weights is unequal.

3) It is not very sensitive to the size of the master step


#### Diagonal AdaGrad (this version is the one used in practice)

* its main characteristic is to maintain and adapts one learning rate per dimension.

### RMSprop (Root mean square prop)

which can also accelerate gradient descent. RMSprop uses the same concept of the exponentially weighted average of gradient as gradient descent with momentum but the difference is parameter update.

### Adam (Adaptive Moment Estimation)

```python

```

### LBFGS 

The optimizer was used it in [Neural Style Transfer](https://youtu.be/B22nIUhXo4E?list=PLBoQnSflObcmbfshq9oNs41vODgXG-608&t=593)


<img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1">


<!-- <img src="https://render.githubusercontent.com/render/math?math=\alpha">
<img src="https://render.githubusercontent.com/render/math?math=\beta">
<img src="https://render.githubusercontent.com/render/math?math=\theta">
 -->

Cost function $J(\theta)$, Want $min_\theta J(\theta)$.
Given $\theta$, we have code that can compute:
* $J(\theta)$
* $\frac{d}{d\theta_j}J(\theta)$               (for $j=0,1,...n$)

**Gradient descent:**

Repeat {

   $\theta_j = \theta_j - \alpha\frac{d}{d\theta_j}J(\theta)$

}

Other than Gradient descent, a more advance is:

* Conjugate gradient
* BFGS
* L-BFGS

The advantages are:
* no need to manually pick $\alpha$ (Learning rate)
* Often faster than gradient descent (Those algorithms converge much faster)

Disadvatages:
* More complex


# References

[Link](https://youtu.be/mdKjMPmcWjY)

[Stochastic Gradient Descent vs Gradient Descent](https://youtu.be/FpDsDn-fBKA)