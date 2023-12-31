`A constructor is a method that is called to create an instance or object of a class.``
:   When there is no constructor implemented in a class, a default constructor is always implemented by the compiler automatically. When called, it creates an object in which the fields are initialized to their default values.

`Calling a Constructor from Another Constructor`
    : writing ':this(<args>)'
    
 ```c#
class VendingMachine {

  private bool _onOff;
  private int _count;
  private int _capacity = 100;
  private int _moneyCollected;
  // A parameter-less constructor implemented
  public VendingMachine() { 
    // Use of this keyword on the left side of = operator
    this._onOff = false;
    this._count = 0;
    this._moneyCollected = 0;

  }
  // A parameterized constructor implemented
  public VendingMachine(bool onOff , int count) { 
    // Use of this keyword on the left side of = operator
    this._onOff = onOff;
    this._count = count;

  }

  public VendingMachine(bool onOff , int count, int moneyCollected) 
    : this(onOff,count) // Calling the above parameterized constructor
  {
    this._moneyCollected = moneyCollected;

  }

  // A simple print function
  public void PrintFields(){ 
    
    Console.WriteLine("Is the machine turned on? {0}", this._onOff);
    Console.WriteLine("The count of products is: {0}", this._count);
    Console.WriteLine("The capacity of machine is: {0}", this._capacity);
    Console.WriteLine("The total money collected till now is: {0}\n", this._moneyCollected);
  }
  
}

class Demo {
  
  public static void Main(string[] args) {
    // Object created with parameterized constructor!
    var vendingMachine1 = new VendingMachine(true,50,10);
    // Object created with overloaded constructor! 
    var vendingMachine2 = new VendingMachine(true,5);
    // Object created with parameter-less constructor!
    var vendingMachine3 = new VendingMachine();
    vendingMachine1.PrintFields();
    vendingMachine2.PrintFields();
    vendingMachine3.PrintFields();

  }
  
}
 ```