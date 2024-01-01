We could redefine a method several times with the same name but with a different number of arguments and/or types. When the method is called, the appropriate definition will be selected by the compiler **at the compile time**.

> Note: Methods that have no arguments and differ only in the return types cannot be overloaded since the compiler won’t be able to differentiate between their calls.

```c#
class Calculator {

  public double Product(double x, double y) {
    return x * y;
  }

  // Overloading the function to handle three arguments
  public double Product(double x, double y, double z) {
    return x * y * z;
  }

  // Overloading the function to handle int
  public int Product(int x, int y){
    return x * y;
  }

}

class Demo {
  
  public static void  Main(string[] args) {
    Calculator calculator = new Calculator();
    
    double x = 10;
    double y = 20;
    double z = 5;
    
    int a = 12;
    int b = 4;
    
    Console.WriteLine(calculator.Product(x, y));
    Console.WriteLine(calculator.Product(x, y, z));
    Console.WriteLine(calculator.Product(a, b));
  }
  
}
```