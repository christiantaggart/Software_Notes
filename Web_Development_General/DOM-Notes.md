# DOCUMENT OBJECT MODEL

_**DOM** is platform neutral_

- DOM can be represented:
  - textual:HTML XML SVG;
  - structurally as represented via the DOM
  - virtually rendered in a browser
- DOM Heiarchy
  - root node === tree trunk === window object
  - nodes === branches(nodes can have nodes)
  - node contains another node is known as a parent object
  - node contained in another node is a child node (html > head > etc)
- Misc:
  - DOM is specific to the browser
  - DOM exists to represent a DOCUMENT(html etc)

DOM Selectors: (methods to use on DOM elements/objects)

**Methods**:

```js
getElementbyID()
getElementsByClassName()
getElementsByName()
getElementsByTagName()
getElementsByTagNameNS()
querySelector()
querySelectorAll()
```

**Properties**:

```js
childNodes
firstChild
lastChild
parentNode
nextSibling
previousSibling
```