## Lisa Lecture
### [Trees](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-3/03-trees.md)

[HOW TO SEARCH](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-3/04-searching-trees.md)


- Trees are **hierarchical** as opposed to linear.

- Trees are used to model all sorts of things, many of which you've interacted with already such as filesystems and the HTML DOM in web browsers.

- Root - node at the top of the tree.
- Parent - node above a node.
- Child - node below a node.
- Link - connection from a node to another node.
- Edge - another term for a Link.
- Grandparent - parent of parent.
- Grandchild - child of child.
- Sibling - children of same parent.
- Leaf Node - node that does not have a child.
- Internal Node - node that has a child.
- Ancestor/Descendent - the child or child of a child at any depth.
- Height/Max Depth - Number of edges in longest path from X to a leaf.
- Depth - length of the path from root to node X or number of edges in path from root to node X.



#### Depth First Search (DFS)

Example of DFS Pre-order for a tree:
![](http://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif)

Pre-order vs In-order vs Post-order

Here is some potential step by step pseudo code for implementing DFS Pre-order (with a return value of an array of all the nodes - this can also be done with a callback for additional functionality)



### Breadth First Search for a Tree (BFS)
- Breadth-first search (BFS) is a strategy for searching in a tree in level order.
- BFS begins at a root node and inspects all the neighboring nodes.
- Then for each of those neighbor nodes in turn, it inspects their neighbor nodes which were unvisited, and so on.
  - This is commonly implemented with a queue.

Example of BFS in a tree:
![](http://upload.wikimedia.org/wikipedia/commons/5/5d/Breadth-First-Search-Algorithm.gif)


- BFS or DFS?
Which is better? From Stack Overflow:

That heavily depends on the structure of the search tree and the number and location of solutions (aka searched-for items). If you know a solution is not far from the root of the tree, a breadth first search (BFS) might be better. If the tree is very deep and solutions are rare, depth first search (DFS) might take an extremely long time, but BFS could be faster. If the tree is very wide, a BFS might need too much memory, so it might be completely impractical. If solutions are frequent but located deep in the tree, BFS could be impractical. If the search tree is very deep you will need to restrict the search depth for depth first search (DFS), anyway (for example with iterative deepening).
