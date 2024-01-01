
```c#
What is the output of the following piece of code?


class Base {
  
  public Base() {}
  public void Print() { 
        Console.WriteLine("Base");
  }
}

class Derived : Base {

  public Derived() {}
  public new void Print() {
    Console.WriteLine("Derived");
  }
}

class Demo {
  
  public static void Main(string[] args) {
    Base obj = new Derived();
    obj.Print();
  }
}
```

> Output: `Base`

```c#
// Base Class
class Product {

  // Private Data Members
  private string _className;
  
  public Product() { // Default Constructor
  	this._className = "Product";
  }

  // Getter Function
  public virtual string GetName() {
    return this._className;
  }
  
}

// Derived Class
class XProduct : Product { 
  
  private string _className;
  
  public XProduct(string className) { // Default Constructor
    this._className = className;
  }
  
  // Overriden Method
  public override string GetName() { 
    return base.GetName() + ", " +this._className;
  }
  
}

class Demo {
  
 public static void Main(string[] args) {
   
   Product beverage = new XProduct("Beverage");
   Console.WriteLine(beverage.GetName());
    
 }
}
```

> Output: `Product, Beverage`

```c#
// Base Class
class Shape {
  
  public Shape() {} // Default Constructor
  

  // Getter Function
  public virtual double ClacArea() {
    return 0;
  }
  
}

// Derived Class
class Circle : Shape { 
  
  private double _radius;
  
  public Circle(double radius) { // Constructor
    this._radius = radius;
   
  }
  
  // Overridden CalcArea() method which returns the area of Rectangle

  public override double ClacArea() {
    return (this._radius * this._radius) * 3.14;
  }
  
}

class Demo {
  
 public static void Main(string[] args) {
   Shape circle = new Circle(2);
   Console.WriteLine(circle.ClacArea());
  }
  
}
```

> Output: `12.56`


```c#
class Account {

    private double _balance;

    protected double Balance {
        get { return this._balance; }
        // Check before setting the balance
        set { if(value>=0)
              this._balance = value;
            }
    }
    // Constructor
    public Account(double balance) {
        this.Balance = balance;
    }
    //Virtual Methods
    public virtual bool Deposit(double amount) {

        return false;
    }


    public virtual bool Withdraw(double amount) {

        return false;
    }


    public virtual void PrintBalance() {

        Console.WriteLine("The balance is: " + Balance);
    }


}

class SavingsAccount : Account {

    private double _interestRate;
    // Constructor
    public SavingsAccount(double balance)
        : base(balance)
    {   // It's always preferable to initialize fields inside a constructor
        this._interestRate = 0.8;
    }
    // Overridden Methods
    public override bool Deposit(double amount) {
        if(amount > 0) { // Check if amount is non-zero and non-negative
            // Adding to balance with interest rate
            Balance += amount + (amount * this._interestRate);
            return true;
        }
        return false;
    }


    public override bool Withdraw(double amount) {
        if(amount > 0 && amount <= Balance) { // Check if amount is non-zero, non-negative and less than equal to balance
            // Deducting from balance with interest rate
            Balance -= amount + (amount * this._interestRate);
            return true;
        }
        return false;
    }


    public override void PrintBalance() {

        Console.WriteLine("The saving account balance is: " + base.Balance);
    }

}

class CheckingAccount : Account
{
    // Constructor
    public CheckingAccount(double balance)
        : base(balance) { }

    // Overridden Methods
    public override bool Deposit(double amount) {
        if (amount > 0)
        {
            Balance += amount;
            return true;
        }
        return false;
    }


    public override bool Withdraw(double amount) {
        if (amount > 0 && amount <= Balance)
        {
            Balance -= amount;
            return true;
        }
        return false;
    }


    public override void PrintBalance() {

        Console.WriteLine("The checking account balance is: " + base.Balance);
    }

}

class Demo {

    public static void Main(string[] args) {

        Account SAccount = new SavingsAccount(5000);

        // Creating saving account object
        SAccount.Deposit(1000);
        SAccount.PrintBalance();

        SAccount.Withdraw(3000);
        SAccount.PrintBalance();

        Console.WriteLine();

        // Creating checking account object
        Account CAccount = new CheckingAccount(5000);
        CAccount.Deposit(1000);
        CAccount.PrintBalance();

        CAccount.Withdraw(3000);
        CAccount.PrintBalance();

    }

}
```

> Output:

```md
The saving account balance is: 6800
The saving account balance is: 1400

The checking account balance is: 6000
The checking account balance is: 3000
```