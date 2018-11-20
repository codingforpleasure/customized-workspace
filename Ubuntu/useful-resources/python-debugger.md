<!--ts-->
   * [Intro](#intro)
      * [Run a debugging session](#run-a-debugging-session)
      * [Setting a breakpoint](#setting-a-breakpoint)
      * [Some useful commands with pdb (python's debugger)](#some-useful-commands-with-pdb-pythons-debugger)

<!-- Added by: gil_diy, at: 2018-11-20T03:59+02:00 -->

<!--te-->

# Intro
Very similiar to the well known GDB (GNU debugger) used in c/c++,
those commands are self explanatory.

## Run a debugging session
```bash
python3 -m pdb buggy_program.py
```

## Setting a breakpoint
Enter the following line where you would like
```python
import pdb; pdb.set_trace()
```

## Some useful commands with pdb (python's debugger)

command | Description
------------|-----
 (b)reak | List all the breakpoints
 (cl)ear | Remove a breakpoint
 (l)ist | List the code surrounding our current line
 (p)rint | Print the value of any variables in your program
 (n)ext | Go to next line
 (s)tep | Step into the function
 (cont)inue | Continue to the next breakpoint
 (w)here or bt | Print the current stack frame of the program
 (u)p | Move your program up in the stack frame
 (d)own | Move your program down in the stack frame
 restart | Restart the current debugged program and debugging session

