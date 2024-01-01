# when do we use inheritance?
Wherever we come across an IS A relationship between objects, we can use inheritance.
Let’s have a look at 'Rust'(Subclass) classe which can be derived using ProgrammingLanguage(Superclass).

> Note: In C#, a class can extend (inherit) from only one other class at a time and a class cannot extend itself.

# Protect
The accessibility of the members declared with the protected access modifier is limited to the class containing it and the classes which derived from this class.

```c#
class Product { // Base Product class
  // Protected field
  protected double price = 50;
  // Protected method
  protected void Print() {
    Console.WriteLine("Hi! I am the Print() method from the Product class");
  }
}

class Beverage : Product { // Derived Beverage class

    public void Access() {
      // Accessing the protected field
      Console.WriteLine("I can Access price: " + price);
      // Accessing the protected method
      Print();
    }  
}

class Demo {

    public static void Main(string[] args) {
      var cola = new Beverage();
      cola.Access();
    }

}
```

Next example

Example
The follow code won’t compile because Subclass is not calling the parent class constructor.

```c#
class A {
    
    int i;
    public A(int i)
    {
        this.i=i; 
    }
    
}
class B : A{
    
    int j;
    public B(int j)
    {
        this.j=j;
    }
    
}
```

Next sample

```c#
// Base Class
class Product {

  // Private Data Members
  private string name;
  private double price;

  // Getter method for name
  public string GetName(int liters) {
      if (liters == 1) {
          this.name = "Cola";
          return this.name;
      }
      else if (liters == 2) {
          this.name = "Fanta";
          return this.name;
      }
      else if (liters == 3) {
          this.name = "Dew";
          return this.name;
      }
      else return "";
  }

  // Getter method for price
  public double GetPrice(int liters) {
      if (liters == 1) {
          this.price = 2;
          return this.price;
      }
      
      else if (liters == 2) {
          this.price = 3.5;
          return this.price;
      }
  
      else if (liters == 3) {
          this.price = 4;
          return this.price;
      }
      else return 0;
  }

}

// Derived Class
class Beverage : Product { 

    public int Liters { get; set; } //  Liters of a Beverage

    public string GetDetails() {
        string details = GetName(this.Liters) + ", " + GetPrice(this.Liters) + ", " + Liters;
        return details;
    }

}

 
class Demo {

    public static void Main(string[] args) {
        Beverage berverage = new Beverage();
        berverage.Liters = 2;
        Console.WriteLine(berverage.GetDetails());
    }

}
```