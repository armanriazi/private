
# Var
sing var, the compiler automatically infers the type of the object being created from the right side of the assignment operator.

# This
The this reference variable exists for every class. It refers to the current instance of a class. The this.memberName specifies that we are accessing the memberName of the current object.
The purpose of using this here is to differentiate between the arguments being passed to the method and the fields of the class.

```c#
class VendingMachine {

  private int moneyCollected = 70;
  
  // A simple print function
  public void PrintMoney(int moneyCollected){ 
    Console.WriteLine("Money Collected using this variable: " + this.moneyCollected);
    Console.WriteLine("Money Collected without using this variable: " + moneyCollected);
  }
  
}

class Demo {
  
  public static void Main(string[] args) {
    //passing the parameters
    var vendingMachine = new VendingMachine(); // Object created with parameterized constructor!
    vendingMachine.PrintMoney(-10);
  }
  
}
```


# Base vs This

[encapsulation](./Encapsulation/encapsulation.md)