<!--ts-->
   * [Pytorch-Lightining](#pytorch-lightining)

<!-- Added by: gil_diy, at: Sun 20 Mar 2022 10:30:56 IST -->

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

    # Move the Optimizer(s) and LR Scheduler(s)    
    def configure_optimizers(self):
	    optimizer = torch.optim.Adam(self.parameters(), lr=1e-3)
	    lr_scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=1)
	    return [optimizer], [lr_scheduler]
```