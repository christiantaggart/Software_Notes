# [Search](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-2/02-searching-algorithms.md)

- implement linear search
- implement Binary search
- Evaluate Big O of Search algorithms
  - Linear search runs at O(n).
  - Binary Search runs at O(log n)

### [Linear Search](https://en.wikipedia.org/wiki/Brute-force_search) on an Unordered Array
- Linear search (or sequential) search is a method for finding a particular value in an array, that consists of checking every one of its elements, one at a time and in sequence, until the desired one is found.
- Linear search is the simplest search algorithm; it is a type of **[brute-force search](https://en.wikipedia.org/wiki/Brute-force_search)**.
- Linear Search is the only algorithm that can be used when given an array that is unordered (ie unsorted).

- The algorithm is written below in pseudocode:
```js
//FROM
linear_search(arr, target):
  for each index i in arr
    if arr[i] = target
      return i

  return -1
```

### Linear Search on an Ordered Array:

- When searching an array that is already ordered (i.e., sorted).
This allows us to make assumptions that if we are searching and we are finding values less than the value we are looking for, we can terminate.
- The algorithm (written in pseudocode) for searching for an element e in the array arr is as follows:

```js
ordered_linear_search(arr, target):
  for each index i in arr
    if arr[i] = target
      return i

    if arr[i] < target
      return -1

  return -1
```
---

## Binary Search:
- The most efficient way to search an array that is already sorted is Binary search.

- The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array.
  - If the target value is equal to the middle element's value, then the position is returned and the search is finished.
  - If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array.
  - This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).

- The algorithm is as follows (in pseudocode):

```js
binary_search(arr, target):
   lo = 1, hi = arr.length
   while lo <= hi:
      mid = floor(lo + (hi - lo) / 2)
      if A[mid] == target:
         return mid            
      else if A[mid] < target:
         lo = mid + 1
      else:
         hi = mid - 1

   return -1
```
- In binary search, one comparison allows us to throw out half of the potential candidates in the array (this is due to the ordered property).
- We apply these comparisons multiple times, halving the array each time.
- The produces the opposite effect of multiplying by 2 each time. The complexity of the algorithm is therefore logarithmic or O(log n).
