
# Rules to be Followed

- [x] An abstract method cannot be declared with the private or sealed modifier as it has to be implemented in some other class.
- [x] Abstract methods are implicitly virtual so we cannot use the keyword virtual in their declaration.
An abstract class cannot be instantiated i.e. one cannot create an object of an abstract class.
- [x] To use the members of an abstract class, it needs to be inherited.
- [x] The class which inherits from the abstract class must implement all the abstract members declared in the parent abstract class.
- [x] An abstract class can have everything else , i.e. constructors, static variables and methods, the same way as a normal C# class has them.
- [x] An abstract class can inherit from both abstract and non-abstract classes.
- [x] A non-abstract class can inherit from only one abstract class.

```c#
abstract class EDM {

  public EDM() {
    //Parameter-less constructor
  }
  public abstract void Transact();

  public void Dispense() {
    Console.WriteLine("{0} is dispensing the product!",this.GetType().Name);
    //this.GetType().Name is an inbuilt functionality of C#
    //to get the class name from which the method is being called
  }
  
}

class CardVendingMachine : EDM {

  public override void Transact() {
    Console.WriteLine("I accept cards only!");
  }
  
}

class CashVendingMachine : EDM {

  public override void Transact() {
    Console.WriteLine("I accept cash only!");
  }
  
}

class HybridVendingMachine : EDM {

  public override void Transact() {
    Console.WriteLine("I accept both cards and cash!");
  }
  
}

class Demo {
  
  public static void Main(string[] args) {
    // Creating the objects
    EDM cardVendy = new CardVendingMachine();  
    EDM cashVendy = new CashVendingMachine();
    EDM hybridVendy = new HybridVendingMachine();

    cardVendy.Dispense();    // Calling methods from CardVendingMachine
    cardVendy.Transact();
    Console.WriteLine();
    cashVendy.Dispense();   // Calling methods from CashVendingMachine
    cashVendy.Transact();    
    Console.WriteLine();
    hybridVendy.Dispense(); // Calling methods from HybridVendingMachine
    hybridVendy.Transact();  
    
  }
  
}
```

> `Output`

```md
CardVendingMachine is dispensing the product!
I accept cards only!

CashVendingMachine is dispensing the product!
I accept cash only!

HybridVendingMachine is dispensing the product!
I accept both cards and cash!
```


```c#
// Abstarct Book Class
abstract class Book {

  // Private Fields
  private string _name;
  private string _author;
  private string _price;

  protected string Name{
    get {return this._name;}
  }
   protected string Author{
    get {return this._author;}
  }
   protected string Price{
    get {return this._price;}
  }

  // Parameterized Constructor
  public Book(string name, string author, string price) {
    this._name = name;
    this._author = author;
    this._price = price;
  }

  // Abstract Method
  public abstract string GetDetails();

}

// Class MyBook extending Book Class
class MyBook : Book {

  // Parameterized Constructor
  public MyBook(string name, string author, string price) 
    : base(name, author, price)
  { }

  // Overrideing the GetDetails Abstract Method of the Base Class
  public override string GetDetails() {
   return Name + ", " + Author + ", " + Price;
  }

}

class Demo {

  public static void Main(string[] args) {
    Book myBook = new MyBook("Harry Potter", "J.k. Rowling", "100");
    Console.WriteLine(myBook.GetDetails());

  }
  
}
```

> `Output:` Harry Potter, J.k. Rowling, 100