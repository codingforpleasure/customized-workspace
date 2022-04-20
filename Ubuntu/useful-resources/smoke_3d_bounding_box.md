<!--ts-->
   * [SMOKE](#smoke)
      * [Inference](#inference)
      * [For Training:](#for-training)
      * [Testing set](#testing-set)

<!-- Added by: gil_diy, at: Fri 05 Feb 2021 10:16:25 IST -->

<!--te-->

# SMOKE

[gitbub repo](https://github.com/lzccccc/SMOKE)

## Inference 

Run the following command:

```bash
python tools/plain_train_net.py --eval-only --config-file "configs/smoke_gn_vector.yaml"
```

The inference output will appear in:
`tools/logs/inference/kitti_test/`


## For Training:

```bash
python tools/plain_train_net.py --config-file "configs/smoke_gn_vector.yaml"
```

output file will appear in:
Saving checkpoint to `./tools/logs/model_final.pth`


/home/gil_diy/Downloads/SMOKE_4/SMOKE/tools/logs/model_final.pth
## Testing set 

Decrease testing set in the file `test.txt`:

```bash
/SMOKE_final/SMOKE/datasets/kitti/testing/ImageSets/test.txt
```