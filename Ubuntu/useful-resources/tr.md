<!--ts-->
   * [tr (translate or delete characters)](#tr-translate-or-delete-characters)
      * [Example #1: maps character b to character <code>d</code>:](#example-1-maps-character-b-to-character-d)
      * [Example #2: maps multiple characters](#example-2-maps-multiple-characters)
      * [Example #3: maps each character to it's uppercase form:](#example-3-maps-each-character-to-its-uppercase-form)
      * [Example #4: maps each character in the set abcdefghi to character <code>_</code>:](#example-4-maps-each-character-in-the-set-abcdefghi-to-character-_)
      * [Example #5: maps each character in the set [a-z] to character <code>x</code> (it's case sensitive of-course):](#example-5-maps-each-character-in-the-set-a-z-to-character-x-its-case-sensitive-of-course)
      * [Example #6: deleting specific characters:](#example-6-deleting-specific-characters)
      * [Example #7: Sqeezing repeated characters:](#example-7-sqeezing-repeated-characters)
      * [Example #8: Translate braces into parenthesis](#example-8-translate-braces-into-parenthesis)

<!-- Added by: gil_diy, at: 2020-02-05T16:31+02:00 -->

<!--te-->

# tr (translate or delete characters)

`Important remark`: tr substitutes individual characters, not strings (if strings is the case please use sed)

## Example #1: maps character `b` to character `d`:
```bash
 > echo big | tr b d
 > dig
```
> **Great purpose is for renaming files with spaces so you can covert them to dash**

## Example #2: maps multiple characters
Here I'm mapping character `a` to character `i` and character `d` to character `g`:

```bash
echo "bad" | tr 'ad' 'ig'
```

## Example #3: maps each character to it's uppercase form:
```bash
 > echo welcome | tr [:lower:] [:upper:]
 > WELCOME
```
> **In zsh you should add quote parameters containing [], looks like this: "[:lower:]"**

## Example #4: maps each character in the set `abcdefghi` to character `_`:
```bash
 > echo welcome | tr abcdefghijkl _
 > w_l_om_
```

## Example #5: maps each character in the set `[a-z]` to character `x` (it's case sensitive of-course):
```bash
 > echo WelCome | tr [a-z] x
 > WxxCxxx
```
> **In zsh you should add quote parameters containing [], looks like this: "[a-z]"**

## Example #6: deleting specific characters:
```bash
 > echo shirt | tr --delete r
 > shit
```
> **Would be great for deleting all spaces**

## Example #7: Sqeezing repeated characters:
```bash
 > echo "nice    works.        looks great" | tr --squeeze-repeats " "
 > nice works. looks great
```
> **Would be great for deleting unnecessary spaces**

## Example #8: Translate braces into parenthesis

```bash
 > tr '{}' '()' < inputfile > outputfile
```
