<!--ts-->
   * [Useful packages](#useful-packages)
      * [ast package - converting from string into list](#ast-package---converting-from-string-into-list)

<!-- Added by: gil_diy, at: 2020-10-13T09:55+03:00 -->

<!--te-->


# Useful packages

## ast package - converting from string into list
```python
import ast

df = pd.read_csv(os.path.join(DATA_PATH, "train.csv"))
df.bbox = df.bbox.apply(ast.literal_eval)
```
