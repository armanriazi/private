- [x] Interfaces allow us to achieve 100% abstraction.
- [x] An interface can extend from interfaces only, but not abstract class.
- [x] An interface is just like an abstract class but only specifies the behavior that a class must implement.
- [x] An interface can be thought of as a contract that a class has to fulfill while implementing that interface. According to this contract, the class that implements an interface has to implement all the abstract members declared in that very interface.
- [x] All the members declared in an interface are by default public abstract so we do not need to write these modifiers while declaring the members.
- [x] Just like an abstract class, an interface cannot be instantiated.
- [x] An interface cannot have constructor(s) in it.
- [x] A class cannot extend from more than one class, but it can implement any number of interfaces.
- [x] An interface can inherit from another interface.
- [x] An interface cannot be declared sealed or read-only.
- [x] Interfaces can be used to achieve loose coupling in an application. This means that a change in one class doesn’t affect the implementation of the other class. In other words, in an application, the code in a class becomes immutable and mutually exclusive since it doesn’t get affected by changes in some other class.
- [x] By using interfaces, one can break up complex designs and clear the dependencies between objects.

```c#
// Base abstract class
abstract class EDM {

  public EDM() {
    //Parameter-less constructor
  }
  public abstract void Transact(bool successful);

  public void Dispense() {
    Console.WriteLine("{0} is dispensing the product!",this.GetType().Name);
    //this.GetType().Name is an inbuilt functionality of C#
    //to get the class name from which the method is being called
  }
  
}

// ICanPrint interface
interface ICanPrint {
  // Public abstract method
  void PrintReceipt();
}

class CashVendingMachine : EDM, ICanPrint { //Inherits from EDM, Implements ICanPrint

    public override void Transact(bool successful) {
      if(successful) {
        Console.WriteLine("The transaction was successfully completed!");
        PrintReceipt();
      }
      else Console.WriteLine("The transaction was unsuccessful!");
  }
  // Implementing the abstract method from ICanPrint
  public void PrintReceipt() {
    Console.WriteLine("Printing your receipt...");
  }
  
}



class Demo {
  
  public static void Main(string[] args) {
    // Creating the objects
    EDM cashVendy = new CashVendingMachine();

    cashVendy.Dispense();   // Calling methods from CashVendingMachine
    cashVendy.Transact(true);    
    Console.WriteLine();
    cashVendy.Transact(false);  
    
  }
  
}
```

> 'Output'

```md
CashVendingMachine is dispensing the product!
The transaction was successfully completed!
Printing your receipt...

The transaction was unsuccessful!
```

