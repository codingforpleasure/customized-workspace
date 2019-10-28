<!--ts-->
<!--te-->


# Grid


[Link](https://css-tricks.com/snippets/css/complete-guide-grid/)

Title1 | Title2
------------|-----
fr | fraction


```css

.portfolio {
	display: grid;
	height: 100%;
	grid-template-rows: repeat(6,1fr);
	grid-template-columns: repeat(5,1fr);
	grid-gap: 20px;

}
```
