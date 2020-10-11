
<!--ts-->
   * [CNN](#cnn)
      * [What are the effects of the kernel?](#what-are-the-effects-of-the-kernel)
      * [Features/Activation maps and image features](#featuresactivation-maps-and-image-features)
      * [Designing feature maps](#designing-feature-maps)

<!-- Added by: gil_diy, at: 2020-10-11T17:11+03:00 -->

<!--te-->
# CNN

## What are the effects of the kernel?

- Depending on the values on the kernel,
we produce different maps. Applying our kernel produces scalar ourput as we just saw.

- Concolcing with different kernels produces intresting feature maps that can be used to detect different features.

- Convolution keeps rhe spatial relationships between pixels by learning image features over the small segments we pass ofwe rhe input image

[Types of kernels](https://en.wikipedia.org/wiki/Kernel_(image_processing))



## Features/Activation maps and image features

* Each cell in our activation matrix can be considered a feature extractor or neuron that looks at specific region of the image.

* In the first few layers, our neurons activation when edges or other.
 low level features are detected in Deeper layers, our neurons will be able to detect high level or big picture features or patterns such as bicycle, face. cat etc


 ## Designing feature maps

  - Remember feature or activation maps were output of applying convolution operator.
  - We applied a 3x3 filter or kernel in our example
  - But, does the filter have to be 3x3? How many filters to we need? Do we need to pass over pixel by 
    pixel?
  - By tweaking the following **parameters** to control the size of our **featur