<!--ts-->
   * [Tensorboard](#tensorboard)
      * [Install](#install)
      * [Get tensor board](#get-tensor-board)
      * [Add metrics and stats](#add-metrics-and-stats)
      * [Experimenting with hyper parameters tunning](#experimenting-with-hyper-parameters-tunning)

<!-- Added by: gil_diy, at: Sat 30 Jan 2021 15:36:45 IST -->

<!--te-->

# Tensorboard

## Install 

```python
pip install tensorboard
```


## Get tensor board

Make sure the the runs directory was created and contains files with the extension: `tfevents`,

```python
tensorboard --logdir=runs
```


## Add metrics and stats

The first argument is called the tag (name of the value)

 Type of metric| Title2
------------|----------
 adding histogram | `tb.add_histogram('conv1.bias', network.conv1.bias, epoch)`
 Adding scalar  | `tb.add_scalar('Loss', total_loss, epoch)`
 Adding images  | `tb.add_image('images', grid)`
 Adding graph  | `tb.add_graph(network, images)`


```python
# in the epoch scope after the batch loop:
for name, weight in network.named_parameters():
	tb.add_histogram(name, epoch)
	tb.add_histogram(f'{name}.grad', weight.grad, epoch)
```



```python
comment = f' batch_size={batch_size} lr={lr}'
# will allow us identify the run inside tensorboard
tb=SummaryWriter(comment=comment)
```

## Experimenting with hyper parameters tunning 
This allows us to work with a single loop no matter how many parameters we have, 
we use cartezian product:
```python
from itertools import product

parameters = dict(
	lr = [.01, .001],
	batch_size = [10,100,1000],
	shuffle = [True, False]	
	)

param_values = [v for v in parameters.values()]

for lr,batch_size, shuffle in product(*param_values):
	print(lr, batch_size, shuffle)
	comment = f' batch_size={batch_size} lr={lr} shuffle={shuffle}'

	# Training process given the set of parameters
```