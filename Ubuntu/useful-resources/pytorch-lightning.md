<!--ts-->
   * [Pytorch-Lightining](#pytorch-lightining)

<!-- Added by: gil_diy, at: Sun 20 Mar 2022 10:29:50 IST -->

<!--te-->

# Pytorch-Lightining

```python
class LitModel(pl.LightningModule):
    def __init__(self):
        super().__init__()
        self.layer_1 = nn.Linear(28 * 28, 128)
        self.layer_2 = nn.Linear(128, 10)

    def forward(self, x):
        x = x.view(x.size(0), -1)
        x = self.layer_1(x)
        x = F.relu(x)
        x = self.layer_2(x)
        return x
```