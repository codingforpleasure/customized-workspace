<!--ts-->
   * [Manim](#manim)
      * [Options](#options)
      * [Operations](#operations)
         * [Add/remove text from the screen without animation](#addremove-text-from-the-screen-without-animation)
         * [Adding text to the screen with animation](#adding-text-to-the-screen-with-animation)
      * [Text transformations](#text-transformations)
      * [animations](#animations)
      * [Positions](#positions)
      * [Contstants](#contstants)

<!-- Added by: gil_diy, at: 2020-04-25T12:06+03:00 -->

<!--te-->

# Manim


```bash
pipenv run python manim.py example_scenes.py SquareToCircle -pl
```

## Options

shorthand | option | Description
------------|----- |-------------
 `-p`|  `--preview` | Automatically open the saved file once its done
 `-w`| `--write_to_movie` | Render the scene as a movie file
 `-l`| `--low_quality` | Render at a low quality (for faster rendering)
 `-i`|`--save_as_gif`| Save the video as gif
 `-g`| `--save_pngs` | Save each frame as a png
 `-t`|`--transparent`| Render to a movie file with an alpha channel
 `-o`| `--file_name` | Specify the name of the output file
  ``| `--video_output_dir` | directory to write video







## Operations

### Add/remove text from the screen without animation

```python
text = TextObject("my text")
self.add(text)
self.wait() # waits 1 second by default
self.remove(text)
self.wait() # waits 1 second by default
```


[Reference](https://www.youtube.com/watch?v=QEdVn8socC8&list=PL2B6OzTsMUrwo4hA3BBfS7ZR34K361Z8F&index=13)

```python
class FormulaColor1(Scene):
	def construct(self):
		text = TextMobject("x","=","{a","\\over","b}").scale(3)

		text[0].set_color(RED)
		text[1].set_color(BLUE)
		text[2].set_color(GREEN)
		text[3].set_color(ORANGE)
		text[4].set_color(YELLOW)

		self.play(Write(text))
		self.write(2)
```
### Adding text to the screen with animation
```python
text = TextObject("my text")
self.play(FadeIn(text), run_time=3) # Animation will take 3 seconds
```
## Text transformations

```python
class TransfromationText1V1(Scene):
    def construct(self):
        text_object1 = TextMobject("First text")
        text_object2 = TextMobject("Second text")
        self.play(Write(text_object1))
        self.wait()
        self.play(Transform(text_object1, text_object2))
        self.wait()
```

![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)

## animations

All animationes appear in `./manimlib/animation` .

Function | Description
------------|-----
 FadeIn | element-description
 FadeInFrom | 
 FadeInFromDown | 
 FadeInFromPoint |
 FadeInFromLarge |  
 VFadeIn | 
 FadeOutAndShift |  
 FadeOutAndShiftDown | 
 VFadeOut | 
 VFadeInThenOut |



## Positions

hhj

## Contstants

For adding new colors:

```bash
./manimlib/constants.py
```	



