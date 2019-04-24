<!--ts-->
   * [Makefile](#makefile)
      * [few examples of makefiles:](#few-examples-of-makefiles)
         * [Example #1:](#example-1)
         * [Example #2:](#example-2)
         * [Example #3:](#example-3)
         * [Example #4:](#example-4)
         * [Example #5:](#example-5)
         * [Example $6:](#example-6)
      * [References](#references)

<!-- Added by: gil_diy, at: 2019-04-24T14:58+03:00 -->

<!--te-->

# Makefile
A makefile is a file (by default named "Makefile") containing a set of directives used by a make build automation tool to generate a target/goal.

## few examples of makefiles:

### Example #1:
```bash
hellomake: hellomake.c hellofunc.c
     gcc -o hellomake hellomake.c hellofunc.c -I.
```


### Example #2:
```bash
CC=gcc
CFLAGS=-I.

hellomake: hellomake.o hellofunc.o
     $(CC) -o hellomake hellomake.o hellofunc.o
```

### Example #3:
```bash
CFLAGS = -Wall
LDFLAGS = -lm # not really needed for this exercise
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

### Example #4:
```bash
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o
```

### Example #5:
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


### Example $6:
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

## References
[Introduction to makefiles](https://physicscodingclub.github.io/slides/2017-08-25-intro_to_makefiles.pdf)

[practical makefile](http://nuclear.mutantstargoat.com/articles/make/#practical-makefile)

[makefile tutorial](https://makefiletutorial.com/)

