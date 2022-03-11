<!--ts-->
   * [word2vec](#word2vec)
      * [Reductions for computing the Softmax function:](#reductions-for-computing-the-softmax-function)
         * [Hierarchical Softmax](#hierarchical-softmax)
         * [Negative sampling](#negative-sampling)

<!-- Added by: gil_diy, at: Fri 11 Mar 2022 10:24:54 IST -->

<!--te-->


# word2vec



## Reductions for computing the `Softmax` function:

### Hierarchical Softmax

where each of the elements of the activated output vector is the probability of the word to be equal to the j-th word in the vocabulary given our input word I. Also, it’s worth mentioning that the sum of the elements of the output vector is equal to 1 and each of the elements of it is mapped into a range [0,1].

The computational complexity of this algorithm computed in a straightforward fashion is the size of our vocabulary, **O(V), which is very costly**.


The main motivation behind this methodology is the fact that we’re evaluating about logarithm to base 2 of V instead of V.



### Negative sampling