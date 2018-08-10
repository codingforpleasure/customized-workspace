## **tr (translate or delete characters)**
### Example #1: maps character `b` to character `d`:
```bash
 > echo big | tr b d
 > dig
```
> **Great purpose is for renaming files with spaces so you can covert them to dash**

### Example #2: maps each character to it's uppercase form:
```bash
 > echo welcome | tr [:lower:] [:upper:]
 > WELCOME
```
> **In zsh you should add quote parameters containing [], looks like this: "[:lower:]"**

### Example #3: maps each character in the set `abcdefghi` to character `_`:
```bash
 > echo welcome | tr abcdefghijkl _
 > w_l_om_
```

### Example #4: maps each character in the set `[a-z]` to character `x` (it's case sensitive of-course):
```bash
 > echo WelCome | tr [a-z] x
 > WxxCxxx
```
> **In zsh you should add quote parameters containing [], looks like this: "[a-z]"**

### Example #5: deleting specific characters:
```bash
 > echo shirt | tr --delete r
 > shit
```
> **Would be great for deleting all spaces**

### Example #6: sqeezing repeated characters:
```bash
 > echo "nice    works.        looks great" | tr --squeeze-repeats " "
 > nice works. looks great
```
> **Would be great for deleting unnecessary spaces**
