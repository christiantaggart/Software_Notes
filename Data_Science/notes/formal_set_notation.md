# Probability & Statistics notes

- **Union:** `A ∪ B` [wiki](https://en.wikipedia.org/wiki/Union_(set_theory))
  - x is in A or x is in B

```math
A \cup B = \{ x: x \in A \cup x\in B \}
```

```py
A = {'a', 'c', 'd'}
B = {'c', 'd', 2 }

print('A U B =', A.union(B))
# or
```

---

- **Intersection:** `A ∩ B`
  - x is in both A and B

```math
A \cap B = \{x: x \in A \cap x\in B\}
```

```py
A = {2, 3, 5, 4}
B = {2, 5, 100}
print(A.intersection(B))
# or
print(A & B)
```

---

- **Difference:** `A \ B`
  - x is in A but x is not in B

```math
A \setminus B = \{x: x \in A \cap x \notin B\}
```

```py
A = {'a', 'b', 'c', 'd'}
B = {'c', 'f', 'g'}

# Equivalent to A-B
print(A.difference(B))
# or
print(A-B)
```

---

- **Complement:** `Ac`
  - x  is not in A  

```math
A^C = \{x: x\notin A\}
```

```py
    diff = a.difference(b)
    # or
    diff = a - b
```

---

- **null (empty) set**
  - The null set is empty. It contains no elements.

```math
\emptyset
```

![media-stats table](https://github.com/christiantaggart/Software_Notes/blob/master/Data_Science/media/stats_operations.png)

---
