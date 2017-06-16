# SORTING ALGORITHMS
[good info](https://khan4019.github.io/front-end-Interview-Questions/sort.html)
### Objectives
- Conceptually know how these work:

#### [bubble & insertion & Selection](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-2/03-sorting-intro.md)
#### [Merge, Quick](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-2/04-advanced-sorting.md)

---

### Bubble:
  - COMPARES RIGHT TO LEFT then Start over
    BIG O == (On2)
![](https://students-gschool-production.s3.amazonaws.com/uploads/asset/file/175/bubblesort.gif)
- Of the algorithms we'll be presenting, Bubble Sort is the sorting algorithm with the worst complexity.
- The algorithm works by running through the array from left to right and swapping any two values it finds such that array[i] > array[i+1].
- Each time you run this process, at least one element ends up in its sorted position.

Pseudo code

- 1.) For each element in the list, look at the element to the right.

- 2.) If the value on the left is greater than the value on the right, swap the two values.

- 3.) Keep swapping until you're at the end of the array. Then move onto the next element in the array and repeat.

```js
function bubbleSort(arr) {
  var done = false;
  while (!done) {
      done = true;
      for (var i = 1; i < arr.length; i++) {
          if (arr[i-1] > arr[i]) {
              done = false;
              [arr[i-1], arr[i]] = [arr[i], arr[i-1]]
          }
      }
  }
  return arr;
}
```
- Bubble sort is NOT an efficient algorithm.
- Its worst case performance is O(n2) (quadratic time), because you have to make n iterations through a list checking all n elements each pass.

---

### Selection Sort:
##### BIG O == (On2)

  - Selection sort is very similar to bubble sort.
    - The difference is that instead of comparing each array item to its neighbor, the goal is to locate the smallest remaining value and drop it into the correct place in the array.
  -  This algorithm breaks the array into two sections, the sorted and unsorted sections.
    - At the start of the algorithm, the whole array is the unsorted section.

- Pick the item at the left-most point in the unsorted section. Call this the current minimum.
- Compare this current minimum to each item in the unsorted section.
  - If any item in the unsorted section is smaller than the current minimum, set that item as the current minimum.
  - When you've reached the end of the unsorted section the current minimum must be the absolute minimum value in the unsorted section.
- Swap the absolute minimum to the left-most index in the unsorted section.
  - This item is now the right most member of the sorted section.

![](https://students-gschool-production.s3.amazonaws.com/uploads/asset/file/174/selectionsort.gif)
###### The sorted section is colored gold, the current minimum is colored red, the unsorted section is colored light blue.

- Although bubble sort and selection sort are both O(n^2), bubble sort will always perform more total operations (swaps + comparisons).

---

### Insertion Sort:
  - Insertion sort works by taking your array and incrementally sorting the values on the left hand side.
  - Similar to selection sort, this algorithm makes distinction between a sorted section and an unsorted section.
  - Unlike selection sort, insertion sort grabs the next unsorted item (as opposed to the smallest unsorted item) and places it into the correct place in the sorted section.
  - Selection sort always places an item in the right-most position of the sorted section, insertion sort will search for the right index within the sorted section.
##### Pseudo code:
- 1.) Select Left-most item in unsorted section
GREEN:
  - **Left-most === Current Item**
- 2.) Select the Right-most index of the sorted section and
YELLOW:
  - **This element  == current Sorted-Item**.
  - ``Current Item < Sorted-Item?``
  - Compare the current item to the current sorted item
  - If current item is less than the value of current sorted item, swap the two.
  - Move Sorted-Item to Left side
  - Now update current sorted item to be the item to the left of current item's new position.
RED:
  - Repeat this process until current item is greater than or equal to the current sorted item. Now current item is part of the sorted section.
- 3.) Repeat until the unsorted section is empty.

![](https://students-gschool-production.s3.amazonaws.com/uploads/asset/file/173/insertionsort.gif)
##### Explain
- After step 1, the first two elements will be sorted.
- After step 2, the first three elements will be sorted.
  - After repeating step 2 once, the first four elements will be sorted, and so on.
- After each step in the process, the sorted portion of the area increases in size by 1, until the entire array is sorted.
### Big O (Complexity)
- If the array is already sorted, insertion sort is relatively fast at O(n).
- But in general, the complexity here is O(n2).
- Can you convince yourself why this is the case after you've implemented insertion sort on your own?

```js
function sort(values) {
  var length = values.length;
  for(var i = 1; i < length; ++i) {
    var temp = values[i];
    var j = i - 1;
    for(; j >= 0 && values[j] > temp; --j) {
      values[j+1] = values[j];
    }
    values[j+1] = temp;
  }
};
sort([7, 4, 5, 2, 9, 1]);
//finished
```
---

### Merge Sort:
  - Split in half until each is 1
Big O == (Onlog1)
![](https://students-gschool-production.s3.amazonaws.com/uploads/asset/file/172/mergesort.gif)

```js
function merge(arr1, arr2) {
  // 1. declare a new empty array, and pointers corresponding to indices in arr1 and arr2 (set them both to 0)

  // 2. if the first element in arr1 is less than the first element in arr2, push the first element in arr1 to the new array, and move the pointer for arr1 one spot to the right. Otherwise, do this for arr2.

  // 3. Repeat this process until you've gone through one of the arrays

  // return the new array, concatenated with whatever elements are remaining from the array that you haven't exhausted yet.
}

```
---
### Quick Sort:
  - scan entire list
  - grab one item **Pivot** from either end of list
  - Compare everything to **Pivot**
Big O == (Olog(n))
![](https://students-gschool-production.s3.amazonaws.com/uploads/asset/file/171/quicksort.gif)


- 1.) Take an element in the array and refer to it as the **pivot**.
  - For simplicity, we'll take the first element in the array to be the **pivot**. (As you'll see, this is a bad choice if the array is already sorted. It makes the algorithm a little easier to reason about though, so we'll take the tradeoff.)
- 2.) Compare every other element to the pivot.
  - If it's less than the **pivot** value, move it to the left of the **pivot**.
  - If it's greater, move it to the right.
    - Don't worry about where on the left or right you're putting these values; the only thing that matters is comparisons to the pivot.
- 3.) Once you're done, the pivot will be in the right place, and you can then recursively repeat this process with the left and right halves of the array.
