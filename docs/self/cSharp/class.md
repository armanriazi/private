A class can be thought of as a **user-defined blueprint or prototype** used for creating objects.


An object is an instance of a class.

A constructor does not have a return type. Not even void!

'new', it realizes that an object is being created and allocates a separate memory location for the object being created.

 # Protection level
 ## Private Modifier
 private members can only be accessed by the methods of that class. A private member cannot be accessed directly from outside the class.
a private field should follow snake_case/camelCase.

## Public
members can be accessed from anywhere in the current assembly or any other assembly that references it.
a public field should follow PascalCase.

## Static Fields
All the objects/instances of this class will share this field and its value.

## Readonly 
field must be assigned a value in the constructor of the class or during initialization. It cannot have its value changed once it is assigned.
## Protect

* [inheritance](./Inheritance/inheritance.md)

```c#
class VendingMachine {

  // Readonly variable manufacturer
  public readonly string Manufacturer;

  public VendingMachine(string s){
     Manufacturer = s; // Assigning a value to readonly member
     System.Console.WriteLine("Manufacturer is {0}", Manufacturer);
  }

}

class Demo {
  
   public static void Main() {
     
      var vendingMachine = new VendingMachine("Vendy"); // Manufacturer is Vendy
      vendingMachine.Manufacturer = "Some other company"; // This will give an error
   }
  
}
```

Next sample:

```c#
class Calculator {
  
  // Class fields
  private double _num1;
  private double _num2;

  // Default Constructor
  public Calculator(double num1, double num2) {
    this._num1 = num1;
    this._num2 = num2;
  }

  // Addition Method
  public double Add() {
    return this._num1 + this._num2;
  }

  // Subtraction Method
  public double Subtract() {
    return this._num2 - this._num1;
  }

  // Multiplication Method
  public double Multiply() {
    return this._num1 * this._num2;
  }

  // Divison Method
  public double Divide() {
    return this._num2 / this._num1;
  }
  
}

class Demo {

  public static void Main(string[] args) {
    Calculator calc = new Calculator(10, 94);

    Console.WriteLine("Addition:" + calc.Add());
    Console.WriteLine("Subtraction:" + calc.Subtract());
    Console.WriteLine("Multiplication:" + calc.Multiply());
    Console.WriteLine("Division:" + calc.Divide());
  }

}
```

## const Fields

const fields are assigned values during their initialization. Unlike readonly fields, values are not assigned in the constructor. 

> Note: The value of a const field is known at compile time, whereas the value of a readonly field is computed when an instance is made.

