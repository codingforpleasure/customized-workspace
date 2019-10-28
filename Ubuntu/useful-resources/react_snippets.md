<!--ts-->
<!--te-->

# React snippets
Taken from here: [Github](https://github.com/dsznajder/vscode-es7-javascript-react-snippets)



## installations:
Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter:

`ext install dsznajder.es7-react-js-snippets`

## Useful snippets
keyword | Description
------------|-----
imrc | import react component ([Link](### imrc))
cc | class component ([Link](### rcc))
rcc | React create component ([Link](### rcc))


## Actual snippets
### rcc
```javascript
import React, { Component } from 'react'

export default class FileName extends Component {
  render() {
    return <div>$2</div>
  }
}
```

### imrc
```javascript
import React, { Component } from 'react';
```
