<!--ts-->
<!--te-->

Apollo


```bash
npm install graphql
```

```bash
npm install -D nodemon
```


# Server side

Must contain a schema describing the graphql schema.
The data looks like a graph, we should inform how specifically how data looks to graphql and to access.

##Schema

Tells graphql the type of data we working with and tells how all the relationships plays out between those pieces of data.

let's create folder and file:

# Client side

```javascript
import React from 'react';
import ReactDom from 'react-dom';
import ApolloClient from 'apollo-client';
import { ApolloProvider } from 'react-apollo';

const client = new ApolloClient({});

const Root = () => {
	return (
		<ApolloProvider client={client}>
		<div> Lyrical</div>
		</ApolloProvider>
	);
};

```
