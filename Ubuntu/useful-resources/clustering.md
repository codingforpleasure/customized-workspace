<!--ts-->
   * [Clustering](#clustering)
      * [The type of clustering algorithms](#the-type-of-clustering-algorithms)
         * [<strong>partitioned based clustering</strong>](#partitioned-based-clustering)
         * [<strong>Hierarchical Clustering</strong>](#hierarchical-clustering)
         * [<strong>Density-based Clustering</strong>](#density-based-clustering)
         * [K-Means](#k-means)
            * [How to evaluate k-mean?](#how-to-evaluate-k-mean)

<!-- Added by: gil_diy, at: 2019-09-22T01:34+03:00 -->

<!--te-->

# Clustering

Belong to unsupervised machine learningm let's list some clustering applications:

* Retail/Marketing:
 	- Identifying buying patterns of customers
 	- Recommending new books or movies to new customers

* Banking
	 - Fraud detection in credit card use
 	- Identifying clusters of customers (e.g., loyal)

* Insurance
 	- clustering is used for fraud detection in claims analysis
 	- Evaluate the insurance risk of certain customers based on their segments

* Publication
 	- Auto-categorizing news based on thier content
 	- Recommending similar news articles

* Medicine
 	- it can be used to characterize patient behavior, based on their similar characteristics So as to identify successful medical therapies for different illnesses

* Biology
 	- clustering is used to group genes with similar expression patterns or to cluster genetic markers to identify family ties.

Clustering can be used for one of the following purposes:

* Exploratory data analysis
* summary generation or reducing the scale,
* outlier detection- especially to be used for fraud detection or noise removal
* finding duplicates and datasets
* a pre-processing step for either prediction
* data mining tasks or as part of a complex system


## The type of clustering algorithms
### **partitioned based clustering**
The following algorithms are relatively efficient and are used for medium and large sized databases.

* K-Means (Group similar customers and assign them to a cluster based on whether they share similar attributes)
* K-median
* Fuzzy C-Means

### **Hierarchical Clustering**
Are generally good to use for small size datasets:

* Produces trees of clusters
* E.g Agglomerative, Divisive

### **Density-based Clustering**

Produces arbitrary shaped clusters
* DBSCAN



Algorithms in depth:


### K-Means

**The simple algorithm:**

1. We must initialize K which represents number of clusters. Essentially, determining the number of clusters in a dataset or K is a hard problem in K-Means.

2.  We initialize k points, called means, randomly.
3.  We categorize each item to its closest centroid and we update the mean’s coordinates, which are the averages of the items categorized in that mean so far.

4.  We repeat the process for a given number of iterations and at the end, we have our clusters.

This continues until the centroids no longer move.Please note that whenever a centroid moves, each points distance to the centroid needs to be measured again.  K-Means is an iterative algorithm and we have to repeat steps two to four until the algorithm converges. In each iteration, it will move the centroids,calculate the distances from new centroids and assign data points to the nearest centroid.

It results in the clusters with minimum error or the most dense clusters.
However, as it is a heuristic algorithm, there is no guarantee that it will converge to the global optimum and the result may depend on the initial clusters.
It means, this algorithm is guaranteed to converge to a result but the result may be a local optimum i.e. not necessarily the best possible outcome. To solve this problem,
it is common to run the whole process multiple times with different starting conditions.
This means with randomized starting centroids, it may give a better outcome.
As the algorithm is usually very fast, it wouldn't be any problem to run it multiple times.

#### How to evaluate k-mean?

how can we evaluate the goodness of the clusters formed by k-Means?
In other words, how do we calculate the accuracy of k-Means clustering?
One way is to compare the clusters with the ground truth, if it's available.
However, because k-Means is an unsupervised algorithm we usually don't have ground truth in real world problems to be used.

So a more rellevant approach would be run the clustering across the different values of K and looking at a metric of accuracy for clustering.
But the problem is that with increasing the number of clusters, the distance of centroids to data points will always reduce.
This means increasing K will always decrease the error. So, the value of the metric as a function of K is plotted and the **elbow point** is determined where the rate of decrease sharply shifts. It is the right K for clustering.
This method is called the **elbow method**.
