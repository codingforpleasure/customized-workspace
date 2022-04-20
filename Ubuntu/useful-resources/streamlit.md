# Streamlit


[Link](https://stackoverflow.com/questions/60172282/how-to-run-debug-a-streamlit-application-from-an-ide)

```python
from streamlit import bootstrap

real_script = 'main_script.py'

bootstrap.run(real_script, f'run.py {real_script}', [], {})
```