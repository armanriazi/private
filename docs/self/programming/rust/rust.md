
### Intro
Rust’s borrow checker works by validating references at compile time, rather than reference counting or performing garbage collection at runtime.
{==

Formatting can also be applied to blocks by putting the opening and closing
tags on separate lines and adding new lines between the tags and the content.

==}

``` py title="bubble_sort.py" linenums="1"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```


``` title=".browserslistrc"
--8<-- ".browserslistrc"
```