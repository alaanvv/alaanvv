Getting a number from a range of $min_1$ to $max_1$ and fitting inside other range of $min_2$ and $max_2$

1. Get percentage of base number in range
	$percentage = 100 \div (max_1 - min_1) \times n$

2. Represent percentage in the other range
	$new\_n = min_2 + (max_2 - min_2) \times percentage$

---
### Simplified

- Ranges starting at **non-zero**
$\Huge new\_n = min_2 + \frac{100 \times (max_2 - min_2) \times n}{max_1 - min_1}$
```js
new_n = min2 + (100 * (max_2 - min_2) * n) / (max_1 - min_1)
```

- Ranges starting at **zero**
$\Huge new\_n = min_2 + \frac{100 \times max_2 \times n}{max_1}$
```js
new_n = (100 * max_2 * n) / max_1
```