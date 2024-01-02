The object whose copies are made is called the prototype. You can think of the prototype object as the seed object from which other objects get created but you might ask why would we want to create copies of objects, why not just create them anew? The motivations for prototype objects are as follows:

Sometimes creating new objects is more expensive than copying existing objects.

    Imagine a class will only be loaded at runtime and you can't access its constructor statically. The run-time environment creates an instance of each dynamically loaded class automatically and registers it with a prototype manager. The application can request objects from the prototype manager which in turn can return clones of the prototype.

    The number of classes in a system can be greatly reduced by varying the values of a cloned object from a prototypical instance.

Formally, the pattern is defined as specify the kind of objects to create using a prototypical instance as a **model** and making copies of the prototype to create new objects.

```java
public interface IAircraftPrototype {

    void fly();

    IAircraftPrototype clone();

    void setEngine(F16Engine f16Engine);
}
public class F16 implements IAircraftPrototype {

    // default engine
    F16Engine f16Engine = new F16Engine();

    @Override
    public void fly() {
        System.out.println("F-16 flying...");
    }

    @Override
    public IAircraftPrototype clone() {
        // Deep clone self and return the product
        return new F16();
    }

    public void setEngine(F16Engine f16Engine) {
        this.f16Engine = f16Engine;
    }
}
public class Client {

    public void main() {

        IAircraftPrototype prototype = new F16();

        // Create F16-A
        IAircraftPrototype f16A = prototype.clone();
        f16A.setEngine(new F16AEngine());

        // Create F16-B
        IAircraftPrototype f16B = prototype.clone();
        f16B.setEngine(new F16BEngine());
    }
}
```

> Note that the interface IAircraftPrototype clone method returns an abstract type. The client doesn't know the concrete subclasses. The Boeing747 class can just as well implement the same interface.


## Dynamic Loading

The prototype pattern also helps with dynamic loading of classes. Language frameworks which allow dynamic loading will create an instance of the loaded class and register it in a managing entity. The application can at runtime request the object of the loaded class from the manager. Note, the application can't access the class's constructor statically.
## Other examples

In Java the root Object class exposes a clone method. The class implements the interface java.lang.Cloneable.

## Caveats
Implementing the clone method can be challenging because of circular references.

