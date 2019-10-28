<!--ts-->
<!--te-->

[Link](https://www.youtube.com/watch?v=PoRJizFvM7s)

const posts = [
	{title: 'Post One', body:'This is post one'},
	{title: 'Post Two', body:'This is post two'},
]


function getPosts(){
	setTimeout(() => {
		let output = '';
		posts.forEach((post)=>{
		output += `<li>${post.title}</li>`;
		})

		document.body.innerHTML= output;

	}, 1000);
}


function createPost(){
	setTimeout(() => {
		posts.push(post)
	},2000);
}

getPosts();
createPost({title:'Post Three', body:'This is post Three'});
