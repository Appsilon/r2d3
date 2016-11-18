# Dom.js [![Build Status](https://travis-ci.org/HenriqueLimas/dom.js.svg?branch=master)](https://travis-ci.org/HenriqueLimas/dom.js)

A JavaScript library that encapsulate DOM methods and makes more easy DOM manipulations.

## Quick start
Run the following command in a shell:
```bash
npm install dom.js --save
```
This will install the DomJs library files in your project's ```node_modules``` folder.

Refer to these files by adding a a ```<script>``` element into your HTML pages:
```html
<script src="node_modules/dom.js/dist/d.min.js"></script>
```

## Examples
Creating elements:
```html
<body>
  <div class="container"></div>
  <script>
    // find the container element using selector expression.
    var container = djs('.container');

    // create an h1 element and append into container.
    container.create('<h1>Hello World</h1>');
  </script>
</body>

```

Creating elements using template literal (ES2015):
```html
<body>
  <div class="container"></div>
  <script>
    // find the container element using selector expression.
    let container = djs('.container');

    let jedis = [
      {name: 'Luke Skywalker'},
      {name: 'Yoda'}
    ];

    let jedisHtml = djs`
      <ul>
        ${jedis.map((jedi) => {
          // Using $$ to escape the html.
          return djs`<li>$${jedi.name}</li>`
        })}
      </ul>
    `
    // create the element and append into container.
    container.create(jedisHtml);
  </script>
</body>

```
## API
- [djs](#djsselector)
  - [Query](#query):
    - [.find(selector)](#djsfindselector)
    - [.findAll(selector)](#djsfindallselector)
  - [Manipulation](#manipulation):
    - [.create(template)](#djscreatetemplate)
    - [.remove(node)](#djsremovenode)
  - [Styles](#styles):
    - [.css(node, cssStyles)](#djscssnodecssstyles)
    - [.addClass(node, className)](#djsaddclassnodeclassname)
    - [.removeClass(node, classToRemove)](#djsremoveclassnodeclasstoremove)
    - [.toggleClass(node, className, force)](#djstoggleclassnodeclassnameforce)
    - [.containsClass(node, className)](#djscontainsclassnodeclassname)
- [DJS element](#djs-element)
  - [Element query](#element-query):
    - [element.find(selector)](#elementfindselector)
    - [element.findAll(selector)](#elementfindallselector)
  - [Element manipulation](#element-manipulation):
    - [element.create(template)](#elementcreatetemplate)
    - [element.remove()](#elementremove)
  - [Element styles](#element-styles):
    - [element.css(cssStyles)](#elementcsscsstyles)
    - [element.addClass(className)](#elementaddclassclassname)
    - [element.removeClass(classToRemove)](#elementremoveclassclasstoremove)
    - [element.toggleClass(className, force)](#elementtoggleclassclassnameforce)
    - [element.containsClass(className)](#elementcontainsclassclassname)

### djs(selector):
***Description*** Find an element using query selector.

***Parameters***:
  - ```selector```(String): A selector expression to find in the DOM.

***Return*** [DJS element](#djs-element) that represent an element found in the DOM.

***Example***:
```javascript
var element = djs('.my-class');
```
<hr>

### djs\`template\`:
**Description** Create a [DJS element](#djs-element) and return it.

**Parameters**:
  - ```template``` (Template Literal): A HTML Template Literal that represent an element to create.

**Return** [DJS element](#djs-element) with the element created.

**Example**:
```javascript
var element = djs`<h1>Hello World</h1>`;
```
<hr>

## Query
### djs.find(selector):
***Description*** Find an element using query selector.

***Parameters***:
  - ```selector```(String): A selector expression to find in the DOM.

***Return*** [DJS element](#djs-element) that represent an element found in the DOM.

***Example***:
```javascript
var element = djs.find('.my-class');
```
<hr>

### djs.findAll(selector):
***Description*** Find all elements in the DOM using query selector.

***Parameters***:
  - ```selector```(String): A selector expression to find in the DOM.

***Return*** [NodeList](https://developer.mozilla.org/en/docs/Web/API/NodeList) that represent an element found in the DOM.

***Example***:
```javascript
var elements = djs.findAll('div');
```
<hr>

## Manipulation
### djs.create(template):
***Description*** Create a [DJS element](#djs-element) and return it.

***Parameters***:
  - ```template``` (String | Template Literal): A HTML Template Literal or string that represent an element to create.

***Return*** [DJS element](#djs-element) with the element created.

***Example***:
```javascript
var element = djs.create(`<h1>Hello World</h1>`);
```
<hr>

### djs.remove(node):
**Description** Remove the element from the DOM.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node))
**Return** [DJS element](#djs-element) with the element removed.

***Example***:
```javascript
var element = djs('body').create('<h1>Hello World</h1>');
djs.remove(element);
```
<hr>

## Styles
### djs.css(node, cssStyles):
***Description*** Add to an element the styles from ```cssStyles``` and prefix css properties when it needs.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)) A node element to add css styles.
  - ```cssStyles```(Object) A object with the [CSS Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference) to be added.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1>Hello World</h1>`);

djs.css(element, {
  backgrounColor: 'red'
});
```
<hr>

### djs.addClass(node, className):
***Description*** Add to an element the CSS classes passed into ```className```.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)) A node element to add css classes.
  - ```className```(String | Array) A string or array of classes to be added.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1>Hello World</h1>`);

djs.addClass(element, ['my-class']);
```
<hr>

### djs.removeClass(node, classToRemove):
***Description*** Remove from an element the CSS class passed into ```classToRemove```.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)) A node element to remove the css class.
  - ```classToRemove```(String) A string of class to be removed.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1 class="class-to-remove">Hello World</h1>`);

djs.removeClass(element, 'class-to-remove');
```
<hr>


### djs.toggleClass(node, className, force):
***Description*** Toggle the CSS class passed as ```className``` from an element.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)) A node element to toggle the css class.
  - ```className```(String) A string of class to be toggled.
  - ```force```(Boolean) When is false and class is not into element, the method does not add the class. 
                         When the class is into element and is truthy, the methdo does not remove the class.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1 class="class-to-remove">Hello World</h1>`);

djs.toggleClass(element, 'class-to-remove');
```
<hr>

### djs.containsClass(node, className):
***Description*** Verify if the ````className``` is into element or not.

***Parameters***:
  - ```node```([DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)) A node element verify if it contains the css class.
  - ```className```(String) A string of class to be checked.

***Return*** (Boolean) Return ```true``` when the class is in element otherwise return false

***Example***:
```javascript
var element = djs.create(`<h1 class="my-class">Hello World</h1>`);

djs.containsClass(element, 'my-class'); // true
```
<hr>


### DJS element
***Description*** An DJS element is a [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) element that has also the djs methods.

#### Methods

## Element query
### element.find(selector):
***Description*** Find an element using query selector and ```element``` as the root node.

***Parameters***:
  - ```selector```(String): A selector expression to find in the DOM.

***Return*** [DJS element](#djs-element) that represent an element found in the DOM.

***Example***:
```javascript
var body = djs('body');
body.find('.my-class');
```
<hr>

### element.findAll(selector):
***Description*** Find all elements in the DOM using query selector and ```element``` as the root node.

***Parameters***:
  - ```selector```(String): A selector expression to find in the DOM.

***Return*** [NodeList](https://developer.mozilla.org/en/docs/Web/API/NodeList) that represent an element found in the DOM.

***Example***:
```javascript
var body = djs('body');
body.findAll('.my-class');
```
<hr>

## Element manipulation
### element.create(template):
**Description** Create a [DJS element](#djs-element), return it and append into ```element```.

**Parameters**:
  - ```template``` (String | Template Literal): A HTML Template Literal or string that represent an element to create.

**Return** [DJS element](#djs-element) with the element created.

***Example***:
```javascript
var body = djs('body');
body.create('<h1>Hello World</h1>');
```
<hr>

### element.remove():
**Description** Remove the element from the DOM.

**Return** [DJS element](#djs-element) with the element removed.

***Example***:
```javascript
var element = djs('body').create('<h1>Hello World</h1>');
element.remove();
```
<hr>


## Element styles
### element.css(cssStyles):
***Description*** Add to the ```element``` the styles from ```cssStyles``` and prefix css properties when it needs.

***Parameters***:
  - ```cssStyles```(Object) A object with the [CSS Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference) to be added.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited.

***Example***:
```javascript
var element = djs.create(`<h1>Hello World</h1>`);

element.css({
  backgrounColor: 'red'
});
```
<hr>

### element.addClass(className):
***Description*** Add to an element the CSS classes passed into ```className```.

***Parameters***:
  - ```className```(String | Array) A string or array of classes to be added.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1>Hello World</h1>`);

element.addClass(['my-class']);
```
<hr>

### element.removeClass(classToRemove):
***Description*** Remove from an element the CSS class passed into ```classToRemove```.

***Parameters***:
  - ```classToRemove```(String) A string of class to be removed.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1 class="class-to-remove">Hello World</h1>`);

element.removeClass('class-to-remove');
```
<hr>


### element.toggleClass(className, force):
***Description*** Toggle the CSS class passed as ```className``` from an element.

***Parameters***:
  - ```className```(String) A string of class to be toggled.
  - ```force```(Boolean) When is false and class is not into element, the method does not add the class. 
                         When the class is into element and is truthy, the methdo does not remove the class.

***Return*** [DJS element](#djs-element) | [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node) with the element edited. Return ```null``` if it is not a valid node (```null```, ```undefined```, ```CommentNode```, ```TextNode```)

***Example***:
```javascript
var element = djs.create(`<h1 class="class-to-remove">Hello World</h1>`);

element.toggleClass('class-to-remove');
```
<hr>

### element.containsClass(className):
***Description*** Verify if the ````className``` is into element or not.

***Parameters***:
  - ```className```(String) A string of class to be checked.

***Return*** (Boolean) Return ```true``` when the class is in element otherwise return false

***Example***:
```javascript
var element = djs.create(`<h1 class="my-class">Hello World</h1>`);

element.containsClass('my-class'); // true
```
<hr>