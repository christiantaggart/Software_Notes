## [Linked List](https://en.wikipedia.org/wiki/Linked_list)

"In computer science, a linked list is a linear collection of data elements, called nodes, each pointing to the next node by means of a pointer. _**-wikipedia**_"


- A linked list is a data structure that helps keep an ordered list of data.
- Similar to other ordered data structures like arrays, the key difference is how an array is stored vs linked list, which has advantages and disadvantages.


<!-- ### Objectives
By the end of this lesson you should be able to: -->

### What is a linked list?
  - A linked list is a sequence of nodes, nodes have two pieces of information:
    - 1.) The value that is being stored.
  _It could be anything like a number, a string, or something more complex._
    - 2.) A reference to the next node.
  _This allows the computer to identify the next node in the sequence._

- Think of the linked list as a set of clues to getting to the end.
  - You start with the first clue, which helps you gain information and leads you to the next clue, which leads you to the next clue, and so on.
- Diagram of a sample linked list of integers:
`4 -> 2 -> 6 -> 1 ->`


- We can describe the above linked list as follows:
  - The first node (often called the **head**) has a value of `4`, and contains a reference to the next node.
  - The next node has a value of `2`, and contains a reference to the next node.
  - The next node has the value of `6` and contains a reference to the next node.
  - The next node has the value of `1` and doesn't reference anything.
  Since it is the last node, it is often called the **tail** of the linked list.







### How is a linked list  stored in memory?

- To have access to a linked list, one must have a reference to the location in memory for the first node (the **head**).
- We call that reference a **pointer**.
- From there, you can read the value at that node, but then you receive the reference to the next node, which is some other location in memory.
**(SINGLY LINKED LIST DIAGRAM)**
![](http://www.cs.usfca.edu/~srollins/courses/cs112-f07/web/notes/linkedlists/ll2.gif)
  _Each Square is a node. Each node has a reference to the item which comes next._

- It looks like the nodes in our list are all in a line.
- In memory, the list is scattered all over the place.
  - Recall that we do not have control over how Objects are stored in The **Heap**.
- The first **object** could be at a very high memory address and the second **object** could be at a very low memory address.
  - The only thing that keeps the list together is the next **pointers**.
  - The next **pointers** are references to where the next element in the `linked list` list is located.
- `Linked Lists` typically have 2 very important **pointers**:
  - The **head**, a **pointer** to the first `node` in the list. Equivalent to `myArray[0]`
  - The **tail**, a **pointer** to the last `node`. Equivalent to `myArray[myArray.length - 1]`



##### ADVANTAGES (linked list vs array):
- Insertions into a list are fast.
  - With `arrays`, there is a process where if we overflow the space for the `array`, it needs to be copied to a new location.
  - This is a linear operation or **O(n)**. With a `linked list`, adding an item is simply creating a node, with a reference to the next node. There is no copying needed. With this in mind, different problems can benefit from `linked lists` on this construct.
- A nice thing about the **singly** `linked list` is that inserting at the end of the list is always **O(1)**.
  - Why is appending to a **singly** `linked list` **O(1)**?
    - Because of the **tail pointer**, we always have constant access to the end of the list.

##### DISADVANTAGES (linked list vs array):
- Recall that for `arrays`, each element is stored next to each other in memory.
  - This makes it incredibly fast to read items in the `array` in order, and to access items at any part in the `array`.
- `Linked Lists` operate differently, since the nodes can be stored in different parts of memory, reading items in a `linked list` involves jumping around from node to node in memory, which is relatively slow.
  - More problematic is that accessing an item everywhere in the list is impossible, because there is no possible way to calculate the location of a particular node in memory.
  - We will demonstrate that with an exercise.

### Implement linked lists using JavaScript.
- JavaScript does not have a built-in linked list like it does for arrays.
- Below is how to construct a linked list.
Let's build a data definition for a linked list that contains integers, but this can be expanded to any data type.

```js
// A Linked List (of Integers) is one of the following:
//   - null
//   - a Node, which is an object of the following format:
     {
       value: Integer,
       next: Linked List
    }
```

- A Linked List is an example of a **recursive** data definition(the data definition references itself)
- This can lead to some really clean solutions using a **recursion**.

- Let's build the same example as above. The simplest linked list is an empty linked list.
- We use `null` to represent an empty linked list.
```js
null
```
- Adding a `node` to it is simply adding a `Node` object.
- We are starting with the **tail** of the list.
  - This is because we add a `node` to the front of the `linked list`. In the example, the **tail** value is 1.
```js
{
  value: 1,
  next: null
}
```
- We can then add another `Node` with the next `node` in the list before the **tail**, 6.
```js
{
  value: 6, // HEAD
  next: {
    value: 1,
    next: null // TAIL
  }
}
```
- We are inserting a node to the front of the linked list.
- Based on the implementation of a pure **singly** `linked list` (a `linked list` where each `node` can only point to the next `node`)
- _**nodes that are inserted last, are the first ones we can access.**_
  - The common term for this is **Last In First Out** or **LIFO**.

- Whenever you need to add or remove an item from the end you follow 3 simple steps:

  - Give the current **tail** a next **pointer** to the new `node`.
  - Change the **tail** to point to the new `node`.
  - Give the new `node` a next **pointer** of `undefined` or `null`.



### Identify the time and space complexity for operations on a linked list.
- We can apply the same operations with a linked list like we do an array.

- Lookup (by index)- O(n)
- Insert - in front O(1), - in back O(n)
- Delete - By Index O(n), first node O(1)



### Implement a variety of problems involving linked lists.
