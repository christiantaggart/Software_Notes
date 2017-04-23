# LOOPS
[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)
## FOR:

``` bash
for name [in list]
do
  statements that can use $name
done

for (( initialization ; ending condition ; update ))
do
  statements...
done
```
---

## CASE:

``` bash
case expression in
  pattern1 )
    statements ;;
  pattern2 )
    statements ;;
  ...
esac
```
---

## DO WHILE, SWITCH

``` bash
select name [in list]
do
  statements that can use $name
done
```

```bash
while condition; do
  statements
done
```

```bash
until condition; do
  statements
done
```
