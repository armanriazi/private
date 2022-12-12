
### Intro

> Rust’s borrow checker works by validating references at compile time, rather than reference counting or performing garbage collection at runtime.

It’s possible to have multiple immutable references (i.e., read-only references) to objects or variables, but you may never have more than a single active mutable reference.
 The borrow checker will not allow references to out of scope variables, and it only allows one mutable reference or multiple immutable references, but never both.

{==

Formatting can also be applied to blocks by putting the opening and closing
tags on separate lines and adding new lines between the tags and the content.

==}

``` py title="bubble_sort.py" linenums="1" hl_lines="2 3"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```


``` title=".browserslistrc"
--8<-- ".browserslistrc"
```

--8<-- "file.md:2:5"

--8<--
include.md::3
--8<--
