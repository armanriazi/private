# Advantages of Encapsulation

- [x] Classes are easier to change and maintain.
- [x] We can specify which data member we want to keep hidden or accessible.
- [x] We decide which variables can be read or written by the outside world (increases flexibility).


# Corrupted Sample

```c#
// MoneyCollector Class
class MoneyCollector {

  // Public Fields
  public int moneyCollected;
  public int productPrice;
  public int insertedMoney;


  // Parameter-less Constructor to intialize the money collector object
  public MoneyCollector() { 
    this.moneyCollected = 0;
    this.productPrice = 2; // Let's fix the product price to 2$
    this.insertedMoney = 0;
  }

  public void AddMoney(int money) { // Method to add money to collection
    this.insertedMoney = money;
    if (this.insertedMoney >= 0) {  // Check if the customer inserted valid money
      Console.WriteLine("You inserted {0}$",this.insertedMoney);
      this.Change(); // Call the change method to provide change
    }
    else Console.WriteLine("Invalid Insertion");

    this.insertedMoney = 0;
  }

  public void Change() { //method to provide change
    if (this.insertedMoney >= this.productPrice) { //check if any change
      int change = this.insertedMoney - this.productPrice; //calculate change
      // product sold so add its price to collected money
      this.moneyCollected += this.productPrice;
      Console.WriteLine("Your change is: {0}$", change);
    }
    else {
      Console.WriteLine("You didn't insert sufficient money!");
      // the transaction was not successfull so return back the money
      Console.WriteLine("Your change is: {0}$",this.insertedMoney);
    }
  }

  public int GetMoneyCollected() { // Getter to moneyCollected
    return this.moneyCollected;
  }

}

class Demo {

  public static void Main(string[] args) {
    // Create a new money collector object
    var moneyCollector = new MoneyCollector();
    // 3 Customers purchase products
    moneyCollector.AddMoney(2);
    moneyCollector.AddMoney(5);
    moneyCollector.AddMoney(7);
    // getting the collected as 3 products sold it should be 2*3 = 6
    Console.WriteLine("Total collection till now is: {0}$",moneyCollector.GetMoneyCollected());

    //Let's try to corrupt collection
    moneyCollector.moneyCollected = 20;
    Console.WriteLine("Total collection till now is: {0}$",moneyCollector.GetMoneyCollected());
    //The collection was public so we easily changed its value
    //THIS SHOULD NOT HAVE HAPPENED!

  }

}
```

## A Good Implementation

```c#
// MoneyCollector Class
class MoneyCollector {

  // Public Fields
  private int moneyCollected;
  private int productPrice;
  private int insertedMoney;


  // Parameter-less Constructor to intialize the money collector object
  public MoneyCollector() { 
    this.moneyCollected = 0;
    this.productPrice = 2; // Let's fix the product price to 2$
    this.insertedMoney = 0;
  }

  public void AddMoney(int money) { // Method to add money to collection
    this.insertedMoney = money;
    if (this.insertedMoney >= 0) {  // Check if the customer inserted valid money
      Console.WriteLine("You inserted {0}$",this.insertedMoney);
      this.Change(); // Call the change method to provide change
    }
    else Console.WriteLine("Invalid Insertion");
    // as a good practice set inserted to 0 at the end of transaction
    this.insertedMoney = 0;
  }

  private void Change() { //method to provide change
    if (this.insertedMoney >= this.productPrice) { //check if any change
      int change = this.insertedMoney-this.productPrice; //calculate change
      this.moneyCollected += this.productPrice; // Add money to total collection
      Console.WriteLine("Your change is: {0}$",change);
    }
    else {
      Console.WriteLine("You didn't insert sufficient money!");
      // Return whatever the user entered
      Console.WriteLine("Your change is: {0}$",this.insertedMoney);
    }
  }

  public int GetMoneyCollected() { // Getter to moneyCollected
    return this.moneyCollected;
  }

}

class Demo {

  public static void Main(string[] args) {
    // Create a new money collector object
    var moneyCollector = new MoneyCollector();
    // 3 Customers purchase products
    moneyCollector.AddMoney(3);
    moneyCollector.AddMoney(5);
    moneyCollector.AddMoney(7);
    // getting the collected as 3 products sold it should be 2*3 = 6
    Console.WriteLine("Total collection till now is: {0}$",moneyCollector.GetMoneyCollected());

    // Uncommenting the below line will now cause an error
    //moneyCollector.moneyCollected = 20;

  }

}
```

# Internal

The accessibility of the class members declared as internal is limited to the current assembly only, i.e., they cannot be accessed from any other assembly in our code.

## Protected Internal

The accessibility of the class members declared as protected internal is limited to any code in the assembly in which they are declared or from within a derived class in another assembly.

## Private Protected

The accessibility of the class members declared as private protected is limited to the code in the same class or a derived class only inside the assembly which they are declared in.

# Base vs This

As you already know, the this keyword in C# is used to refer to the instance of the current class.

In a similar fashion, the base keyword in C# is used to refer to the base class members from inside the immediate derived class. The use of base comes into play when we implement inheritance.



```c#
class Product { //Base class Product  

  public double price = 1.7; //price field inside base class

} 


class Beverage : Product { // sub class Beverage extending from Product

  new double price = 1; //price field inside derived class

  public void Display() { 
    //accessing the field of parent class using base*/
    Console.WriteLine("Price from the Product class: " + base.price); 
    //without using base the field of current class shadows the field of parant class*/
    Console.WriteLine("Price from the Beverage class: " + this.price); 

  } 

} 

class Demo {

  public static void Main(String[] args) { 
    Beverage cola = new Beverage(); 
    cola.Display(); 
  } 

}
```

Next sample:

```c#
class Product {          // Base class Product 

  public void Display() {   // Display method inside base class
    Console.WriteLine("I am from the Product Class!");
  }

} 

class Beverage : Product { // Sub class Beverage inheriting from Product

  new public void Display() { // Display method inside derived class
    Console.WriteLine("I am from the Beverage Class!");
  } 

  public void PrintOut(){
    Console.WriteLine("The Display() call with base:");
    base.Display();  // Calling the Display() of Product(base class)
    Console.WriteLine("The Display() call without base:");
    Display();       // Calling the Display() of the Beverage(derived class)
  }

} 

class Demo {

  public static void Main(string[] args) {
    Beverage cola = new Beverage(); // An object of derived class
    cola.PrintOut(); 
  }

}
```

> Important Note: If the base class has a default or parameter-less constructor, the compiler implicitly calls the base class constructor before the derived class constructor when an object of the derived class is created.

> Note: In a constructor we can include a call to base() or this() but not both. Also, these calls can only be made after a constructor’s signature and before the start of curly brackets.

```c#
// Base Class Product
class Product {

  // Private Fields: Common attributes of all type of products
  private string _name; 
  private double _price;
  private string _expiryDate;      


  // Parameterized Constructor
  public Product(string name, double price, string expiryDate) {
    this._name = name;
    this._price = price;
    this._expiryDate = expiryDate;  
   
  }

  // public method to print details
  public void PrintDetails() {
    Console.WriteLine("Name: " + this._name);
    Console.WriteLine("Price: " + this._price);
    Console.WriteLine("Expiry Date: " + this._expiryDate);
  }
  
}

// Derived Class Beverage
class Beverage : Product {

  // Private fields : Fields specific to the derived class
  private double _litres;
  private string _flavor;

  // Parameterized Constructor
  public Beverage(string name, double price, string expiryDate, double litres, string flavor) 
    : base(name, price, expiryDate) //calling parent class constructor
  {  
      this._litres = litres;    
      this._flavor = flavor;   
  }

  public void BeverageDetails() {  //details of Beverage
    PrintDetails();         //calling inherited method from parent class
    // Printing fields of this class
    Console.WriteLine("Litres: " + this._litres); 
    Console.WriteLine("Flavor: " + this._flavor);
  }
  
}

class Demo {

  public static void Main(string[] args) {
    Beverage cola = new Beverage("RC Cola", 0.7, "8/12/2019", 0.35, "Cola"); //creation of Beverage Object
    cola.BeverageDetails(); //calling method to print details
  }
  
}
```