<!--ts-->
   * [Pytorch-Lightining](#pytorch-lightining)

<!-- Added by: gil_diy, at: Sun 20 Mar 2022 10:33:19 IST -->

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
    
	def training_step(self, batch, batch_idx):
	    x, y = batch
	    y_hat = self(x)
	    loss = F.cross_entropy(y_hat, y)
	    return loss

	def validation_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        val_loss = F.cross_entropy(y_hat, y)
        self.log("val_loss", val_loss)
```

**Comments:**

* `model.eval()` and `torch.no_grad()` are called automatically for validation.