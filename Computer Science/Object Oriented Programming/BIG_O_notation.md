# [Big O notation](https://learn.galvanize.com/content/gSchool/computer-science-curriculum/master/Unit-1/02-big-o-notation.md):

[WIKI](https://en.wikipedia.org/wiki/Big_O_notation)
[Asymptotic_analysis](https://en.wikipedia.org/wiki/Asymptotic_analysis)

[logarithm](http://www.mclph.umn.edu/mathrefresh/logs.html)

[Big O CHEATSHEET](http://bigocheatsheet.com/)

[STACK 0VERFLOW BREAKDOWN](https://stackoverflow.com/questions/1909307/what-does-on-mean)

#### MATH BEHIND IT
- Basically any 'O' notation means an operation will take time up to a maximum of k*f(N)
where:
- k is a constant multiplier
- f() is a function that depends on N

![](bigOgraph.png)

## [O(1)](https://en.wikipedia.org/wiki/Time_complexity#Constant_time) CONSTANT TIME:

- Not dependent on inputs
  - (constants eg: known amount of outputs eg loop to a certain number(i<5) console.logs)
- O(1) means in constant time - independent of the number of items.

## [O(n)](https://en.wikipedia.org/wiki/Time_complexity#Linear_time) LINEAR TIME:

- O(n) means in proportion to the number of items.
- Grab the polynomial and cancel out the other?
- Takes computation with highest power(decides time to execute)

## [O(log n)](https://en.wikipedia.org/wiki/Time_complexity#Logarithmic_time) logarithmic time algorithms regardless of the base of the logarithm:

- O(log N) means a time proportional to log(N)
- Divide and conquer
