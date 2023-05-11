<!--ts-->
* [Few-shot learning](#few-shot-learning)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Thu 11 May 2023 08:28:34 AM IDT -->

<!--te-->


Few-shot learning means making classification or regression based on a very
small number of samples.

For a human, making a prediction based on tiny (like 4) training samples is not hard. But can computers do this as well?

If a **class has only two samples**, can computers make the correct prediction? This is harder than the standard classification problem.



# Few-shot learning

Few-shot learning is the problem of making predictions based on a limited number of samples. Few-shot learning is different from standard supervised learning. 

* The goal of few-shot learning is **not to let the model recognize the images in the training set and then generalize to the test set**. Instead, the goal is to learn. “Learn to learn” sounds hard to understand. You can think of it in this way.


* I train the model on a big training set. The goal of training is not to know what an elephant is and what a tiger is. Instead, the goal is to **know the similarity and difference between objects**.

* After training, you can show the two images to the model and ask whether the two are the same kind of animals. The model has similarities and differences between objects. So, the model is able to tell that the contents in the two images are the same kind of objects.