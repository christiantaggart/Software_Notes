# Graphs
- [Graphs Wiki](https://en.wikipedia.org/wiki/Graph_(abstract_data_type))



---
STOLEN FROM WIKI WILL NEED EDITING FOR CONCISION:

In computer science, a graph is an abstract data type that is meant to implement the undirected graph and directed graph concepts from mathematics, specifically the field of graph theory.

A graph data structure consists of a finite (and possibly mutable) set of vertices or nodes or points, together with a set of unordered pairs of these vertices for an undirected graph or a set of ordered pairs for a directed graph. These pairs are known as edges, arcs, or lines for an undirected graph and as arrows, directed edges, directed arcs, or directed lines for a directed graph. The vertices may be part of the graph structure, or may be external entities represented by integer indices or references.

A graph data structure may also associate to each edge some edge value, such as a symbolic label or a numeric attribute (cost, capacity, length, etc.).

#####  A graph with three vertices and three edges:
![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Directed.svg/250px-Directed.svg.png)

### Operations:
- The basic operations provided by a graph data structure G usually include:
  - `adjacent`(G, x, y): tests whether there is an edge from the vertex x to the vertex y;
  - `neighbors`(G, x): lists all vertices y such that there is an edge from the vertex x to the vertex y;
  - `add_vertex`(G, x): adds the vertex x, if it is not there;
  - `remove_vertex`(G, x): removes the vertex x, if it is there;
  - `add_edge`(G, x, y): adds the edge from the vertex x to the vertex y, if it is not there;
  - `remove_edge`(G, x, y): removes the edge from the vertex x to the vertex y, if it is there;
  - `get_vertex_value`(G, x): returns the value associated with the vertex x;
  - `set_vertex_value`(G, x, v): sets the value associated with the vertex x to v.

- Structures that associate values to the edges usually also provide:
  - `get_edge_value`(G, x, y): returns the value associated with the edge (x, y);
  - `set_edge_value`(G, x, y, v): sets the value associated with the edge (x, y) to v.


#### Different data structures for the representation of graphs are used in practice:

- Adjacency list
  - Vertices are stored as records or objects, and every vertex stores a list of adjacent vertices. This data structure allows the storage of additional data on the vertices. Additional data can be stored if edges are also stored as objects, in which case each vertex stores its incident edges and each edge stores its incident vertices.
  **slower**
- Adjacency matrix
  - A two-dimensional matrix, in which the rows represent source vertices and columns represent destination vertices. Data on edges and vertices must be stored externally. Only the cost for one edge can be stored between each pair of vertices.
  **Less space efficient**
  **FAST**
- Incidence matrix
  - A two-dimensional Boolean matrix, in which the rows represent the vertices and columns represent the edges. The entries indicate whether the vertex at a row is incident to the edge at a column.



----

# NOTES FROM Alicia's Lecture:


- Describe components of a graph
  - vertex edges(directed and undirected), weight
- Describe two ways to store graphs in memory

### cyclic graph is one that go in a directional loop (1=> 2 => 3=>1)
### acyclic graph with no cycle
### DAG: Directive Acyclic Graph


###  Weighted Graph:
![](https://www.math.cornell.edu/~numb3rs/blanco/net_dif.png)
  - In weighted graphs, each edge (or vertex) of G is assigned a numerical value, or weight.
    - The edges of a road network graph might be weighted with their length, drive-time or speed limit. In unweighted graphs, there is no cost distinction between various edges and vertices.


### BREADTH FIRST SEARCH:
- go across ancestors vs go down entire path
