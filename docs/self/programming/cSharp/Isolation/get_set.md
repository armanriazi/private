
```c#
// VendingMachine class
class VendingMachine {
  
  private int _count; // member field count
  private int _capacity = 100;

  //no fields declared
  // Implementing the auto-implemented property for count
  // One drawback of this auto-implemented property is that we cannot set any conditional checks while setting or accessing the fields.
  public int Count {get; set;} 

  /*
  // Setter method to set the count of the products
  public void SetCount(int x) {
    if(x >=0 && x <= _capacity) { // count should always be positive and less than or equal to capacity
    _count = x; 
    }
  }

  // Getter method to get the count of the products
  public int GetCount() {
    return _count; 
  }
  */
}

class Demo {
  
   public static void Main(string[] args) {
     var vendingMachine = new VendingMachine();
     vendingMachine.SetCount(88); // calling the setter method
     Console.WriteLine("The count is: {0}", vendingMachine.GetCount()); // calling the getter method
   } 
  
}
```

Next sample:

```c#
class Student {
  //fields
  private string _name;
  private double _physicsMarks;
  private double _chemistryMarks;
  private double _biologyMarks;
  //properties
  public string Name {
    get {
      return this._name;
    }
    /*
      set
    {
      this._name = value;
    }
    */
  }

  public double PhysicsMarks {
    get {
      return this._physicsMarks;
    }
  }

  public double ChemistryMarks {
    get {
      return this._chemistryMarks;
    }
  }

  public double BiologyMarks {
    get {
      return this._biologyMarks;
    }
  }
  // Parameterized constructor
  public Student(string name, double phy, double chem, double bio) { 
    this._name = name;
    this._physicsMarks = phy;
    this._chemistryMarks = chem;
    this._biologyMarks = bio;
  }

  public double TotalObtained() {
    double totalMarks = PhysicsMarks + ChemistryMarks + BiologyMarks;    
    return totalMarks;
  }

   public double Percentage() {
    return (TotalObtained()/300) * 100;
  }

}
class Demo {
  public static void Main(string[] args) {
    Student john = new Student("John", 75, 75, 90);
    Console.WriteLine(john.TotalObtained());
    Console.WriteLine(john.Percentage());
    Console.WriteLine(john.ChemistryMarks);
  }

}
```