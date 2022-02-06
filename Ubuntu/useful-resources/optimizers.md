<!--ts-->
   * [Optimizers](#optimizers)
      * [Optimizers](#optimizers-1)
         * [Gradient Descent](#gradient-descent)
         * [Stochastic Gradient Descent (SGD)](#stochastic-gradient-descent-sgd)
         * [Stochastic Gradient Descent with mini-batches](#stochastic-gradient-descent-with-mini-batches)
         * [SGD With momentum (with Exponentially Weighted Moving Average)](#sgd-with-momentum-with-exponentially-weighted-moving-average)
         * [Adam (Adaptive Moment Estimation)](#adam-adaptive-moment-estimation)
         * [LBFGS](#lbfgs)
   * [References](#references)

<!-- Added by: gil_diy, at: Sun 06 Feb 2022 19:20:13 IST -->

<!--te-->

# Optimizers

[Pytorch optimizers](https://pytorch.org/docs/1.9.1/optim.html)

## Optimizers 

[Link](file:///home/gil_diy/my_documentation_helper/opencv/opencv.html)

### Gradient Descent

### Stochastic Gradient Descent (SGD)

### Stochastic Gradient Descent with mini-batches

### SGD With momentum (with Exponentially Weighted Moving Average)

The above shows gradient descent with momentum term, where the `lr` is actually fixed for all parameters on different dimension. 

### 

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