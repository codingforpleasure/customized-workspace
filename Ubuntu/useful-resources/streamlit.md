# Streamlit


[Link](https://stackoverflow.com/questions/60172282/how-to-run-debug-a-streamlit-application-from-an-ide)

```python
from streamlit import bootstrap

real_script = 'main_script.py'

bootstrap.run(real_script, f'run.py {real_script}', [], {})
```


## Debug Streamlit with pycharm

```python
from streamlit.web import bootstrap

real_script = 'app.py'
bootstrap.run(real_script, f'run.py {real_script}', [], {})
```

was checked and works on `Streamlit 1.16.0`
