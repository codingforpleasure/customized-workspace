<!--ts-->
* [Makefile](#makefile)
   * [Debug](#debug)
   * [Automatic variables:](#automatic-variables)
   * [Few Useful flags:](#few-useful-flags)
   * [few examples of makefiles:](#few-examples-of-makefiles)
      * [For C language](#for-c-language)
         * [Example #1:](#example-1)
         * [Example #2:](#example-2)
         * [Example #3:](#example-3)
         * [Example #4:](#example-4)
         * [Example #5:](#example-5)
         * [Example #6:](#example-6)
         * [Example #7:](#example-7)
         * [Example #8:](#example-8)
         * [Example $6:](#example-6-1)
   * [Common Error](#common-error)
   * [What is files with extension d?](#what-is-files-with-extension-d)
      * [For CPP language](#for-cpp-language)
         * [Example #1](#example-1-1)
   * [Clion Makefile](#clion-makefile)
      * [Add libraries](#add-libraries)
   * [References](#references)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 25 Feb 2023 12:51:26 PM IST -->

<!--te-->

# Makefile
A makefile is a file (by default named "Makefile") containing a set of directives used by a make build automation tool to generate a target/goal.


Basic form of a rule is:

```bash
target: prerequisites
	recipe
```

## Debug



Your directive can't be outside any rule.
You have to create one:
```
mydebug:
        @echo "============= $(TOOLPREFIX) ================="
```

To print ouside of a directive, write:
```
$(info ============= Gil =================)
```

## Automatic variables:

```bash
%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^
```

**$@** and **$ˆ** are automatic variables:

* $@ Expands to the name of the target
* $^ expands to the names of all the prerequisites, separated by spaces

Description | Automatic variable
------------|-----
Expands to the name of the target | $@
The name of the first prerequisite | $<
The names of all the prerequisites | $^
Prerequisites listed more than once are duplicated in the order | $+

For getting a better grasp run this, and see the actual output:
```bash
.PHONY: all

all: hello world

hello world: foo foo foo bar bar
        @echo "== target: $@ =="
        @echo $<
        @echo $^
        @echo $+

foo:
        @echo "Hello foo"

bar:
        @echo "Hello Bar"
```

## Few Useful flags:

Description | how?
------------|-----
Tries to run N recipes at once - very useful for larger projects | `--jobs=N`
N doesn't start new jobs if the load is more than N | `--load-average=N`
Tells make to keep going even if there are **errors** - useful many errors as possible | `--keep-going`
FILE use FILE instead of default makefile | `--file=FILE`
DIRECTORY change DIRECTORY before doing anything | `--directory`
Just print the recipes, instead of running them | `--dry-run`




## few examples of makefiles:

### For C language
#### Example #1:
```bash
hellomake: hellomake.c hellofunc.c
     gcc -o hellomake hellomake.c hellofunc.c -I.
```


#### Example #2:

What if we sometimes want to compile with a different compiler?
Therefore i'll be using variables

```bash
CC=gcc
CFLAGS=-I. -g -Wall

hellomake: hellomake.o hellofunc.o
     $(CC) -o hellomake hellomake.o hellofunc.o
```

#### Example #3:
```bash
CC = gcc
# CFLAGS for C compile flags, CXXFLAGS for C++, FFLAGS for Fortran
CFLAGS = -g -Wall
# LDLIBS for libraries, LDFLAGS for linker flags (i.e. -L)
LDLIBS = -lm
all: program
program: program.o foo.o
	$(CC) $(CFLAGS) -o program program.o foo.o $(LDLIBS)

program.o: program.c$(CC) $(CFLAGS) -c program.c

foo.o: foo.c$(CC) $(CFLAGS) -c foo.c
```

#### Example #4:
We often want to compile from a clean start
The conventional target for this is clean:
```bash

.PHONY: clean
clean:
	rm -fv *.o
```

* We use-fso that rm doesn’t error if a file doesn’t exist (more important if you usea variable here).

* The .PHONY rule tells make that clean doesn’t produce a file named clean.


#### Example #5:
```bash
CC = gcc
CFLAGS = -g -Wall
LDLIBS = -lm

all: program
program: program.o foo.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -fv *.o
```

#### Example #6:
```bash
CFLAGS = -Wall
LDFLAGS = -lm # LDFLAGS for linker flags
CC = gcc -std=c99
ECHO = echo "going to compile for target $@"

OS := $(shell uname)
ifneq (,$(findstring CYGWIN_NT,$(OS)))
	EXT = .exe
else
	EXT =
endif

PROG = ex1_q1$(EXT)

all: $(PROG) test

$(PROG): ex1_q1.o actions.o bitwise.utils.o list.utils.o logging.o math.utils.o polygon.logic.o
	$(CC) $(CFLAGS) ex1_q1.o actions.o bitwise.utils.o list.utils.o logging.o math.utils.o polygon.logic.o -o ex1_q1 $(LDFLAGS)

ex1_q1.o: ex1_q1.c ex1_q1.h globals.h list.utils.h actions.h bitwise.utils.h polygon.logic.h
	$(ECHO)
	$(CC) $(CFLAGS) -c ex1_q1.c

actions.o: actions.c actions.h command.struct.h polygon.struct.h polygon.logic.h logging.h list.utils.h
	$(CC) -c actions.c

bitwise.utils.o: bitwise.utils.c bitwise.utils.h globals.h polygon.enum.h target.enum.h vertex.struct.h command.struct.h polygon.struct.h logging.h
	$(CC) -c bitwise.utils.c

list.utils.o: list.utils.c list.utils.h	list.struct.h logging.h polygon.logic.h
	$(CC) -c list.utils.c

logging.o: logging.c logging.h globals.h
	$(CC) -c logging.c

math.utils.o: math.utils.c math.utils.h vertex.struct.h
	$(CC) -c math.utils.c

polygon.logic.o: polygon.logic.c polygon.logic.h globals.h polygon.enum.h polygon.struct.h list.utils.h math.utils.h
	$(CC) -c polygon.logic.c

clean:
	rm -vf *.o $(PROG) *.log

test:
	# make sure you have input file in.txt.
	# so the following command works
	./$(PROG) < in.txt > out.log

```

#### Example #7:
```bash
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o
```

#### Example #8:
```bash
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
```


#### Example $6:
```bash
IDIR =../include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=obj
LDIR =../lib

LIBS=-lm

_DEPS = hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
```


## Common Error

```Makefile:<line number>: *** missing separator.  Stop.```

It means although you are using the key tab still it's get interpreted 
as spaces. therefore in sublime do the following to the Makefile you wrote:
After opening the file:

View -> Indentation -> Convert Indentation to Tabs

Now re-ran by `make` command and now there will be no error!!


## What is files with extension `d`?

A D file is a source dependency file generated by GCC, a GNU C compiler. It contains dependencies in plain text that describe the files that were used to create compiled objects (. O files) by a C compiler.

### For CPP language

Good to know:

standard | flags
---------|-------
 c++11 | gnu++0x
 c++14 | gnu++1y


#### Example #1
```bash
FILENAME=Main
CC=g++
CPPFLAGS=-I. -std=gnu++0x
DEPS = LinkedList.h Stack.h Queue.h
OBJ = LinkedList.o Stack.o Queue.o Main.o


%.o: %.c
	$(CC) -c -o $@ $< $(CPPFLAGS)

$(FILENAME): $(OBJ)
	$(CC) -o $@ $^ $(CPPFLAGS)

.PHONY: clean
clean:
	rm -fv *.o $(FILENAME)

```

## Clion Makefile

[Reference](https://www.jetbrains.com/help/clion/quick-cmake-tutorial.html#addtargets-reload)

To debug and print on the screen the variables' content:

```
message(STATUS "OpenCV_INCLUDE_DIRS = ${OpenCV_INCLUDE_DIRS}")
message(STATUS "OpenCV_LIBS = ${OpenCV_LIBS}")
```

In order to invoke the CMakeLists.txt you should navigate into the directory which the `CMakeLists.txt` resides and run in the cli:

```bash
cmake .
```

### Add libraries

Example here:

```bash
cmake_minimum_required(VERSION 3.21)
project(my_final_project C)

set(CMAKE_C_STANDARD 11)

add_executable(my_final_project main.c)

# target_link_libraries() should appear after add_executable()

target_link_libraries(my_final_project pthread)
target_link_libraries(my_final_project curl)
target_link_libraries(my_final_project rt)
````

[cmake well explained thoroughly](https://youtu.be/mKZ-i-UfGgQ)

## References

[C Makefile cheatsheet](http://www.csheeet.com/en/latest/notes/c_make.html)

[Introduction to makefiles](https://physicscodingclub.github.io/slides/2017-08-25-intro_to_makefiles.pdf)

[practical makefile](http://nuclear.mutantstargoat.com/articles/make/#practical-makefile)

[makefile tutorial](https://makefiletutorial.com/)

