<!--ts-->
   * [Flask](#flask)
      * [A simple Flask application](#a-simple-flask-application)
      * [Resolving the issue OSError: [Errno 98] Address already in use](#resolving-the-issue-oserror-errno-98-address-already-in-use)
      * [Running flask](#running-flask)
      * [Poject structure](#poject-structure)
      * [Checking api with postman](#checking-api-with-postman)
         * [POST](#post)
         * [GET](#get)
      * [Template](#template)
         * [Rendering Templates](#rendering-templates)
         * [Templates inheritance](#templates-inheritance)
         * [Flask forms](#flask-forms)
         * [Flask](#flask-1)
         * [How to prepare Flask in production?](#how-to-prepare-flask-in-production)

<!-- Added by: gil_diy, at: Sun 03 Apr 2022 14:38:40 IDT -->

<!--te-->

# Flask

## A simple Flask application

for example `my_flask_app.py`:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
	return '<h1>Hello World!</h1>'
```

## Resolving the issue OSError: [Errno 98] Address already in use

You can easily resolve this by first look into the stacktrace,
you will see there is (in file `serving.py`):
```python
s.bind(server_address)
```
you can set a breakpoint and debug and see the port number `('127.0.0.1', 5000)`, which means **port 5000** was already got taken by another process on your local workstation.

therefore you can do one of the solutions:

a) Run the code with specifying another port number:

```python
if __name__ == '__main__':
    app.run(debug=True, port=6000)
```

b) kill the process which is using the port 5000:

```bash
sudo lsof -t -i tcp:5000 # you will get the processid
sudo kill -9 <pid-of-the process>
```






## Running flask

* Enable debug mode so it would be easy to refresh on flow the app.
Either Using Environment variables:

```bash
export FLASK_APP=my_flask_app.py
export FLASK_DEBUG=1
flask run
```

The command `flask run`, this command looks for the name of the Python script that contains the application instance in the FLASK_APP environment variable.


The Flask development web server can also be started programmatically by invoking the app.run() method. the app.run() method can be useful on certain occasions, such as unit testing.

```bash
if __name__ == '__main__':
    app.run(debug=True) # To enable debug mode programmatically
```


## Poject structure
Here below is an example of basic multiple-file Flask application structure

<img src="images/flask/struct.png" title="project structure">


top-level folders:
* The Flask application lives inside a package generically named app
* The migrations folder contains the database migration scripts, as before.
* Unit tests are written in a tests package.

Moreover there are some essentials files:
* config.py stores the configuration settings.
* flasky.py defines the Flask application instance, and also includes a few tasks that help manage the application.


## Checking api with postman

### POST

<p align="center">
  <img width="800" src="images/flask/postman_checking_api.png" title="Look into the image">
</p>

### GET


## Template

A template is a file that contains the text of a response, with placeholder variables for the dynamic parts that will be known only in the context of a request. The process that replaces the variables with actual values and returns a final response string is called rendering. For the task of rendering templates, Flask uses a powerful template engine called Jinja2.


### Rendering Templates

By default Flask looks for templates in a templates subdirectory located inside the main application directory.

```python
posts = [
	{
		'author': 'Cookie monster',
		'title':'My first post',
		'content':'First post content',
		'date_posted':'July 12,2019'

	},
	{
		'author': 'Gil',
		'title':'My second post',
		'content':'Second post content',
		'date_posted':'April 15,2019'
	}
]
```

Passing the list of `posts` into the template:

```python
@app.route("/home")
def home()
	return render_template('home.html', my_posts=posts)
```

The html template (jinja):

```html
<body>
	{% for post in my_posts %}
		<h1>{{ post.title }}</h1>
		<p>By {{ post.author }} on {{ post.date_posted }}</p>
		<p>{{ post.content }}</p>
	{% endfor %}
</body>
```

Many more examples are shown here: [Link](http://jinja.pocoo.org/docs/2.10/templates/)


### Templates inheritance

```html
{% extends "base.html" %}
{% block title %}Home Page {% endblock %}
{% block content %}
<h1>Test</h1>
{% endblock %}
```

### Flask forms

[Registration Form](https://youtu.be/UIJKdCIEXUQ?t=153)
[Login Form](https://youtu.be/UIJKdCIEXUQ?t=528)



### Flask 

[Flask Production Recipes](https://www.toptal.com/flask/flask-production-recipes)


### How to prepare Flask in production?

Although Flask has a built-in web server, as we all know, it’s not suitable for production and needs to be put behind a real web server able to communicate with Flask through a **WSGI protocol**
A common choice for that is **Gunicorn—a Python WSGI HTTP server**.


* Gunicorn works by internally handing the calling of your flask code. This is done by having workers ready to handle the requests instead of the sequential one-at-a-time model that the default flask server provides

The Web Server Gateway Interface (WSGI, pronounced whiskeyWIZ-ghee) is a simple calling convention for web servers to forward requests to web applications or frameworks written in the Python programming language.

* Serving static files and proxying request with Nginx. While being an HTTP web server, Gunicorn, in turn, is an application server not suited to face the web.
That’s why we need Nginx as a reverse proxy and to serve static files. In case we need to scale up our application to multiple servers, Nginx will take care of load balancing as well.


<p align="center">
  <img width="400" src="images/flask/ngnix_gunicorn_flask_togther.jpg" title="Look into the image">
</p>


* **Nginx** is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.


[Link](https://medium.com/ymedialabs-innovation/deploy-flask-app-with-nginx-using-gunicorn-and-supervisor-d7a93aa07c18)

[How to deploy ML models using Flask + Gunicorn + Nginx + Docker](https://towardsdatascience.com/how-to-deploy-ml-models-using-flask-gunicorn-nginx-docker-9b32055b3d0)


