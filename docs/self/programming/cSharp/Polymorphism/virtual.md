
Method overriding is the process of redefining a parent class’ method in a subclass.

The methods in the parent class are called overridden methods and have to be declared virtual.
The methods in the child classes are called overriding methods and have to include the keyword override in their signatures.

Here are some details we should take care of when thinking about overriding a method:

- [x] Method overriding needs inheritance and there should be at least one derived class.
- [x] Derived class(es) must have the same declaration, i.e., the same name, parameters, and return type of the overriding methods as those of the virtual methods in the base class.
- [x] The method in the derived class(es) should have a different implementation from each other.
- [x] The method being overridden should be declared virtual in the base class and the overriding method should be declared with the keyword override.
- [x] The base class or method must not be declared as sealed.


# Method Overloading vs Method Overriding

|           Overloading          |              Overriding           |
|--------------------------------|-----------------------------------|
|  It is done inside the same class. |  Base and derived class(es) are required here. |
|  Overloading happens at compile time.  |  Overriding happens at runtime |
|  Gives better performance because the binding is being done at compile time. |  Gives worse performance because the binding is being done at run time. |
| Private and sealed methods can be overloaded.  |  Private and sealed methods can not be overridden. |
|  Return type of the method does not matter in case of method overloading. |  Return type of the method must be the same in the case of overriding. |
|  Arguments must be different in the case of overloading.  |  Arguments must be the same in the case of overriding. |	
|  Mostly used to increase the readability of the code. |  	Mostly used to have a separate implementation for a method that is already defined in the base class. |  
|  This happens at the compile time, so it can be referred to as static or compile-time polymorphism. |  	This happens at run time, so it can be called dynamic or runtime polymorphism. |  

```c#
class Product
{
    private string _name;
    private double _purchasePrice;
    
    // Parameterized Constructor
    public Product(string name, double purchasePrice)
    {
        this._name = name;
        this._purchasePrice = purchasePrice;
    }

    // Getters
    public string GetName()
    {
        return this._name;
    }

    public double GetPurchasePrice()
    {
        return this._purchasePrice;
    }
    // Method to calculate selling price
    public virtual double GetPrice()
    {
        return 0;
    }
    // Method to print details
    public virtual void PrintDetails()
    {
        Console.WriteLine("Selected Product's Name: " + this.GetName());
    }

}


class Beverage : Product
{

    
    private double _refCost;
    private double _profit;

    // Parameterized Constructor
    public Beverage(string name, double price)
        : base(name,price)
    {
        this._refCost = GetPurchasePrice() * 0.10; // 10% of purchase price
        this._profit = GetPurchasePrice() * 0.15; // 15% of purchase price
    }

     // public method to get selling price
    public override double GetPrice()
    {   //calculating selling price, Math.Round is just an inbuilt method to round off the price
        return (GetPurchasePrice() + (int)Math.Round(this._refCost) + (int)Math.Round(this._profit));
    }

    public override void PrintDetails()
    {
        base.PrintDetails();
        Console.WriteLine("Selling price: {0}", this.GetPrice());
    }

}


class Chocolate : Product
{

    private double _profit;

    // Parameterized Constructor
    public Chocolate(string name, double price)
        : base(name, price)
    {
        this._profit = base.GetPurchasePrice() * 0.20; // 20% of purchase price
    }

    

    // public method to get selling price
    public override double GetPrice()
    {   //calculating selling price, Math.Round is just an inbuilt method to round off the price
        return (base.GetPurchasePrice() + (int)Math.Round(this._profit));
    }


    public override void PrintDetails()
    {
        base.PrintDetails();
        Console.WriteLine("Selling price: {0}", this.GetPrice());
    }

}


class Demo
{

    public static void Main(string[] args)
    {
        // Placing the products in an array
        Product[] products = new Product[4];
        products [0] = new Beverage("Cola", 9);
        products [1] = new Chocolate("Crunch", 15);
        products [2] = new Chocolate("Kit-kat", 20);
        products [3] = new Beverage("Fanta", 8);

        // name and price of respective  product is displayed
        foreach(Product product in products)
        product.PrintDetails();

    }
}
```