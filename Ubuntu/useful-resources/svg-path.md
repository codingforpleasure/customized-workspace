<!--ts-->
   * [Path](#path)
      * [Compact Coding (The Letters commands)](#compact-coding-the-letters-commands)
         * [Straight Lines](#straight-lines)
            * [M](#m)
            * [H](#h)
            * [V](#v)
            * [L](#l)
            * [Z](#z)
         * [Bézier and elliptical curves](#bézier-and-elliptical-curves)
            * [C](#c)
      * [Examples:](#examples)
      * [stroke-dasharray and stroke-dashoffset](#stroke-dasharray-and-stroke-dashoffset)
      * [Very useful](#very-useful)

<!-- Added by: gil_diy, at: 2020-07-18T19:38+03:00 -->

<!--te-->

# Path

## Compact Coding (The Letters commands)

There are 18 commands, 
many (but not all of them) come in a pair. There is an UPPERCASE and a lowercase version. The UPPERCASE version is the absolute version and the lowercase is the relative version.

### Straight Lines
#### M 

Pick up the pen and **MOVE** it to the exact location 213.1, 6.7. Don’t draw anything just yet, just move the location of the Pen. So that if other commands do drawing, it now starts at this location. 


`M 100,100`

means “Pick up the pen and move it to the exact coordinates 100,100”

`m 100,100`
means “Move the Pen 100 down and 100 right from wherever you currently are.” or left and up if negative values.


#### H

`H x` Draw a line **horizontally** to the exact coordinate x

`h x` Draw a line **horizontally** relatively to the right x (or to the left if a negative value)

#### V

`V y` Draw a line **vertically** to the exact coordinate y

`v y` Draw a line **vertically** relatively down y (or up if a negative value)

#### L 
draw from the current position to destination position

`L x,y` - Draw a straight **line** to the absolute coordinates x,y

`l x,y` - Draw a straight **line** to a point that is relatively right x and down y (or left and up if negative values).

#### Z

Close path (Draw a straight line back to the start of the path)



### Bézier and elliptical curves

[Great reference](https://css-tricks.com/svg-path-syntax-illustrated-guide/)

#### C 

Symbols | Description
------------|-----
C |
S |
Q |
T |

## Examples:

```html
<path d="M100,100 L150,150"
      style="stroke: #ff0000;
      		 stroke-width: 3;
      		 fill: none;
      		"
/>
```

## stroke-dasharray and stroke-dashoffset

[Link](https://codepen.io/pen/?&editable=true=https%3A%2F%2Fdeveloper.mozilla.org%2Fen-US%2Fdocs%2FWeb%2FSVG%2FAttribute%2Fstroke-dashoffset)

## Very useful

[Python library to draw svg super easily](https://github.com/mozman/svgwrite)

[Python library to SVG path](https://github.com/regebro/svg.path)

