<!--ts-->
   * [Pytest](#pytest)

<!-- Added by: gil_diy, at: Sat 21 May 2022 17:06:40 IDT -->

<!--te-->

# Pytest

```python

class Fruit:
    def __init__(self, name):
        self.name = name

    def __eq__(self, other):
        return self.name == other.name


@pytest.fixture
def my_fruit():
    return Fruit("apple")


@pytest.fixture
def fruit_basket(my_fruit):
    return [Fruit("banana"), my_fruit]


def test_my_fruit_in_basket(my_fruit, fruit_basket):
    assert hasattr(my_fruit, 'namgrfge') == True

```


```bash
pytest -q example.py
```
