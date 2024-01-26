It extends the object behavior at the run time.
The decorator pattern adds new functionality to objects without modifying their defining classes.
The decorator pattern can be thought of as a wrapper or more formally a way to enhance or extend the behavior of an object dynamically. The pattern provides an alternative to subclassing when new functionality is desired.The strategy is to wrap the existing object within a decorator object that usually implements the same interface as the wrapped object.i.e. the decorator takes action either before or after invoking some method on the wrapped.

For instance a car can have a technology package added to the base model, then maybe the sports package so on and so forth. Similarly, our base Boeing-747 model can have two additional properties added to it. One is to let the plane be fitted with luxury fittings and the other is making the plane bullet-proof. 

Say we are interested in the weight of our plane, which can be important in determining the fuel required for flights. Adding either or both of the options would make the plane heavier. We would want an extensible way of adding properties to the plane object and still be able to know its weight with the additional packages installed on the plane.

```java
public interface IAircraft {

    float baseWeight = 100;

    void fly();

    void land();

    float getWeight();

}

public class Boeing747 implements IAircraft {

    @Override
    public void fly() {
        System.out.println("Boeing-747 flying ...");
    }

    @Override
    public void land() {
        System.out.println("Boeing-747 landing ...");
    }

    @Override
    public float getWeight() {
        return baseWeight;
    }
}
public abstract class BoeingDecorator implements IAircraft {

}
public class LuxuryFittings extends BoeingDecorator {

    IAircraft boeing;

    public LuxuryFittings(IAircraft boeing) {
        this.boeing = boeing;
    }

    @Override
    public void fly() {
        boeing.fly();
    }

    @Override
    public void land() {
        boeing.land();
    }

    @Override
    public float getWeight() {
        return (30.5f + boeing.getWeight());
    }
}

public class BulletProof extends BoeingDecorator {

    IAircraft boeing;

    public BulletProof(IAircraft boeing) {
        this.boeing = boeing;

    }

    @Override
    public void fly() {
        boeing.fly();
    }

    @Override
    public void land() {
        boeing.land();
    }

    @Override
    public float getWeight() {
        return 50f + boeing.getWeight();
    }
}
public class Client {

    public void main() {
        IAircraft simpleBoeing = new Boeing747();
        IAircraft luxuriousBoeing = new LuxuryFittings(simpleBoeing);
        IAircraft bulletProofBoeing = new BulletProof(luxuriousBoeing);
        float netWeight = bulletProofBoeing.getWeight();
        System.out.println("Final weight of the plane: " + netWeight);
    }
}
```

From the client code, one can observe how the plane's behavior is extended at runtime. From the client code, one can see how we wrap the boeing object in successive decorators and are able to retrieve the net weight.

## Other Examples
A prominent example of this pattern is the java.io package, which includes several decorators. Look at the snippet below:

```java
    public void main() {
        // FileInputStream is responsible for reading the file
        FileInputStream fileInputStream = new FileInputStream("myFile.txt");
        // BufferedInputStream extends FilterInputStream and not FileInputStream, it is
        // a decorator which enhances the functionality of the original object by wrapping over it.
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        // The read operation becomes buffered now
        bufferedInputStream.read();
    }
```    

## Caveats

One of the issues with the decorator pattern is that we may end up with too many classes as the number of decorators grows. The java.io package suffers from the same issue, as it makes extensive use of the decorator pattern.

Also, if we want to take a specific action based on the concrete type of the plane, we may not be able to do so. Once the concrete object is wrapped inside a decorator the reference to the object is through the abstract type and not the concrete type anymore.

