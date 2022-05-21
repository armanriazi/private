---
tags:
  - clippy
  - dereference
---


**Clippy failed to automatically apply fix: type bool cannot be dereferenced*
<!-- ??? info -->
    
> Try to use .as_mut() it would be fix it

[Github](https://github.com/rust-lang/rust/issues/91561)

```
fn main() {
    let input = ["once  upon a time", "there  was an example"];
    let mut input_iter = input.iter();
    let mut words = vec![];
    for _ in 0..input.len() {
        words.push(
            input_iter
                .next()
                .as_mut()
                .unwrap()
                .split(' ')
                .filter(|x| *x != "")
                .collect::<Vec<_>>(),
        );
    }
    println!("{:?}", words);
}
```


[[issue-rust]]