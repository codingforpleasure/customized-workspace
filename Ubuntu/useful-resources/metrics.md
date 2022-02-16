
<!--ts-->
   * [Metrics](#metrics)
      * [1. Accuracy](#1-accuracy)
      * [2. Recall](#2-recall)
      * [3. precision](#3-precision)
      * [4. F1 (F-score / F-measure)](#4-f1-f-score--f-measure)
      * [5. confusion Matrix](#5-confusion-matrix)
      * [6. ROC Curve](#6-roc-curve)
      * [Precision Recall Curve](#precision-recall-curve)
   * [Link to resource:](#link-to-resource)

<!-- Added by: gil_diy, at: Wed 16 Feb 2022 12:11:16 IST -->

<!--te-->
# Metrics


[Link1](https://youtu.be/aWAnNHXIKww)
[Link2](https://youtu.be/A_ZKMsZ3f3o)
[Link3](https://youtu.be/A_ZKMsZ3f3o)

## 1. Accuracy

<p align="center" style="width:400px;" >
  <img src="images/metrics/accuracy.jpg" title="tool tip here">
</p>


## 2. Recall

Recall (also known as sensitivity) is the fraction of relevant instances that were retrieved

Binary metric to evaluate models with binary output

<p align="center" style="width:400px;" >
  <img src="images/metrics/recall.jpg" title="tool tip here">
</p>


**Recall expresses the abilty to find all relevant instances in a datset**

## 3. precision

Binary metric to evaluate models with binary output, which means:
**of all examples I predicted to be TRUE, how many were actually TRUE**

<p align="center" style="width:400px;" >
  <img src="images/metrics/precision.jpg" title="tool tip here">
</p>


**Precision expresses the proportion of the data points our model says was relevant actually were relevant**


## 4. F1 (F-score / F-measure)

<p align="center"  style="width:400px;" >
  <img src="images/metrics/f1.jpg" title="tool tip here">
</p>


## 5. confusion Matrix

Shows the actual and predicted labels from a classification problem

<p align="center" style="width:400px;" >
  <img src="images/metrics/confusion_metrics.jpg" title="tool tip here">
</p>

## 6. ROC Curve


* Instead of being overwhelmed with confusion matrices **Receiver Operator Charatsitic (ROC)** graphs provide a simple way to summarize all of the information.


* **y-axis** shows the **True Positive Rate**, which is **Sensitivity (Recall)**.

* **x-axis** shows the **False Positive Rate**, which is **(1-Specificity)**.


plots the true positive rate (TPR) versus the false positive rate (FPR) as a function of the model’s threshold for classifying a positive

metric to calculate the overall performance of a classification model based on area under the ROC curve

<p align="center" style="width:400px;">
  <img src="images/metrics/roc.jpg" title="tool tip here">
</p>


for example: 

<p align="center" style="width:400px;">
  <img src="images/metrics/roc2.jpg" title="tool tip here">
</p>

## Precision Recall Curve

# Link to resource:

[Sensitivity_and_specificity](https://en.wikipedia.org/wiki/Sensitivity_and_specificity)