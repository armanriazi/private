The abstract factory pattern solves the problem of creating families of related products. For instance, F-16 needs an engine, a cockpit, and wings. The Boeing-747 would require the same set of parts but they would be specific to Boeing. Any airplane would require these three related parts but the parts will be plane and vendor specific. Can you see a pattern emerge here? We need a framework for creating the related parts for each airplane, a family of parts for the F-16, a family of parts for the Boeing-747 so on and so forth.

Formally, the abstract factory pattern is defined as defining an interface to create families of related or dependent objects without specifying their concrete classes. 

```java
public interface IAircraftFactory {

    IEngine createEngine();

    IWings createWings();

    ICockpit createCockpit();
}

public class Aircraft {

    IEngine engine;
    ICockpit cockpit;
    IWings wings;
    IAircraftFactory factory;

    public Aircraft(IAircraftFactory factory) {
        this.factory = factory;
    }

    protected Aircraft makeAircraft() {
        engine = factory.createEngine();
        cockpit = factory.createCockpit();
        wings = factory.createWings();
        return this;
    }

    private void taxi() {
        System.out.println("Taxing on runway");
    }

    public void fly() {
        Aircraft aircraft = makeAircraft();
        aircraft.taxi();
        System.out.println("Flying");
    }
}
public class F16Factory implements IAircraftFactory {

    @Override
    public IEngine createEngine() {
        return new F16Engine();
    }

    @Override
    public IWings createWings() {
        return new F16Wings();
    }

    @Override
    public ICockpit createCockpit() {
        return new F16Cockpit();
    }
}

public class Boeing747Factory implements IAircraftFactory {

    @Override
    public IEngine createEngine() {
        return new Boeing747Engine();
    }

    @Override
    public IWings createWings() {
        return new Boeing747Wings();
    }

    @Override
    public ICockpit createCockpit() {
        return new Boeing747Cockpit();
    }
}
public class Client {

    public void main() {

        // Instantiate a concrete factory for F-16
        F16Factory f16Factory = new F16Factory();
        
        // Instantiate a concrete factory for Boeing-747
        Boeing747Factory boeing747Factory = new Boeing747Factory();
        
        // Lets create a list of all our airplanes
        Collection<Aircraft> myPlanes = new ArrayList<>();
        
        // Create a new F-16 by passing in the f16 factory
        myPlanes.add(new Aircraft(f16Factory));

        // Create a new Boeing-747 by passing in the boeing factory
        myPlanes.add(new Aircraft(boeing747Factory));

        // Fly all your planes
        for (Aircraft aircraft : myPlanes) {
            aircraft.fly();
        }

    }
}
```


## Other Examples

    The abstract factory is particularly useful for frameworks and toolkits that work on different operating systems. For instance, if your library provides fancy widgets for the UI, then you may need a family of products that work on MacOS and a similar family of products that work on Windows. Similarly, themes used in IDE can be another example. If your IDE supports light and dark themes then it may use the abstract factory pattern to create widgets that belong to the light or dark theme just by varying the concrete factory that creates the widgets.

javax.xml.parsers.DocumentBuilderFactory.newInstance() will return you a factory.

javax.xml.transform.TransformerFactory.newInstance() will return you a factory.


## Caveats

It might appear to the naive reader that the factory method pattern and the abstract factory pattern are similar. The difference between the two lies in their motivations. The factory method pattern is usually responsible for creating a single product whereas an abstract factory pattern creates entire families of related products. Furthermore, in the factory method pattern, we use inheritance to create more specialized products whereas, in an abstract factory pattern, we practice object composition by passing in factories that are consumed to create the desired products.

In our aircraft example, we can add a new aircraft simply by creating a concrete factory for it. However, note that if a helicopter is added to the fleet and requires a part that an aircraft doesn't have, then we'll need to extend the IAircraftFactory interface with another create method for the part required only by the helicopter. This will cascade the change to existing factories that'll need to return null since the new component isn't part of the jets.

Concrete factories can be best represented as a singleton object

