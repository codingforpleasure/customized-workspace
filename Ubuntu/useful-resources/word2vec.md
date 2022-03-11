<!--ts-->
   * [word2vec](#word2vec)
      * [Reductions for computing the Softmax function:](#reductions-for-computing-the-softmax-function)
         * [Hierarchical Softmax](#hierarchical-softmax)
         * [Negative sampling](#negative-sampling)

<!-- Added by: gil_diy, at: Fri 11 Mar 2022 10:26:46 IST -->

<!--te-->


# word2vec



## Reductions for computing the `Softmax` function:

[Link](https://towardsdatascience.com/hierarchical-softmax-and-negative-sampling-short-notes-worth-telling-2672010dbe08)

### Hierarchical Softmax

where each of the elements of the activated output vector is the probability of the word to be equal to the j-th word in the vocabulary given our input word I. Also, it’s worth mentioning that the sum of the elements of the output vector is equal to 1 and each of the elements of it is mapped into a range [0,1].

The computational complexity of this algorithm computed in a straightforward fashion is the size of our vocabulary, **O(V), which is very costly**.


* The main motivation behind this methodology is the fact that we’re evaluating about logarithm to base 2 of V instead of V.

* Which is a dramatical change in computational complexity and number of operations needed for the algorithm.



### Negative sampling