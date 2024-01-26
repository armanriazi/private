Factory pattern is a creational design pattern used to centralize the creation of multiple instances in one place where they are checked to see which type of instance will be created.  It is used to create an instance without specifying the exact class in a single location.

It is used when: 

1) A class doesn't know what sub-classes will be required to ,create beforehand. 
2) You need to centralize the creation of instances of different classes. 
3) All the instances of different classes may require the same parameter. 
4) A new property/function needs to be added to all the classes without code duplication(this way, we don't' enter a new property or function to each class separately). 

A factory produces goods, and a software factory produces objects. Usually, object creation in Java takes place like so:

SomeClass someClassObject = new SomeClass();

The problem with the above approach is that the code using the SomeClass's object, suddenly now becomes dependent on the concrete implementation of SomeClass. There's nothing wrong with using new to create objects but it comes with the baggage of tightly coupling our code to the concrete implementation class, which is a violation of code to an interface and not to an implementation.

Formally, the factory method is defined as providing an interface for object creation but delegating the actual instantiation of objects to subclasses.

```Java

public interface IEngine {

    void start();
}
public interface ICockpit {

    void installed();
}
public class F16 {

    IEngine engine;
    ICockpit cockpit;

    protected F16 makeF16() {
        engine = new F16Engine();
        cockpit = new F16Cockpit();
        return this;
    }
/*  Simple Factory:
 public F16 makeF16(String variant) {

        switch (variant) {
        case "A":
            return new F16A();
        case "B":
            return new F16B();
        default:
            return new F16();
        }
    }
*/
    public void taxi() {
        System.out.println("F16 is taxing on the runway !");
    }

    public void fly() {
        // Note here carefully, the superclass F16 doesn't know
        // what type of F-16 variant it was returned.
        F16 f16 = makeF16();
        f16.taxi();
        System.out.println("F16 is in the air !");
    }
}

public class F16A extends F16 {

    @Override
    public F16 makeF16() {
        super.makeF16();
        engine = new F16AEngine();
        return this;
    }
}

public class F16B extends F16 {

    @Override
    public F16 makeF16() {
        super.makeF16();
        engine = new F16BEngine();
        return this;
    }
}

public class Client {
    public void main() {
        Collection<F16> myAirForce = new ArrayList<F16>();
        F16 f16A = new F16A();
        F16 f16B = new F16B();
        myAirForce.add(f16A);
        myAirForce.add(f16B);

        for (F16 f16 : myAirForce) {
            f16.fly();
        }
    }
}
```


## Other Examples

The factory method pattern pervades toolkits and frameworks. The pattern can be used whenever a class doesn't know ahead of time what subclass objects it would need to instantiate. This is common problem in designing frameworks, where the consumers of the framework are expected to extend framework provided abstract classes and hook-in functionality or object creations.

The Java API exposes several factory methods:
        java.util.Calendar.getInstance()
        java.util.ResourceBundle.getBundle()
        java.text.NumberFormat.getInstance()

## Caveats

The pattern can result in too many subclasse with very minor differences.

If the subclass extends the functionality, then the superclass can't use it unless it downcasts it to the concrete type. The downcast may fail at runtime.

