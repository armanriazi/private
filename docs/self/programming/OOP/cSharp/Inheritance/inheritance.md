# Index

- [Interface](interface.md)

---


A derived class can use all the fields and methods of the superclass directly which are non-private or protected.

# Advantages of Inheritance

- [x] Reusability: ou don’t have to re-declare the fields nor do you have to re-code.
- [x] Code Modification: What happens when you change a method, a data type or something similar?
- [x] Extensibility: An existing class can act as a base class from which a new class with upgraded features can be derived.
- [x] Encapsulation: The base class can decide to keep some data private so that it cannot be altered by the derived class.


## Multi inheritance example

    RedBull IS A Beverage.
    RedBull IS AN EnergyDrink also.


## Hybrid inheritance 
Example

    A RedBull is an EnergyDrink.
    A RedBull is a Beverage.
    Both EnergyDrink and Beverage are products.


> Note: In C#, **multiple and hybrid inheritance** are applicable using interfaces only.


