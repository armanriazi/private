a builder pattern encapsulates or hides the process of building a complex object and **separates the representation of the object and its construction**. The separation allows us to construct **different representations using the same construction process.**

The steps represent the construction process from our formal definition. The product is an aircraft but can have different representations such as an F-16 or a Boeing-747. Using the same construction process, we should be able to produce both F-16s and Boeings.


```java
public abstract class AircraftBuilder {

    public void buildEngine() {

    }

    public void buildWings() {

    }

    public void buildCockpit() {

    }

    public void buildBathrooms() {

    }

    abstract public IAircraft getResult();
}
public class Boeing747Builder extends AircraftBuilder {

    Boeing747 boeing747;

    @Override
    public void buildCockpit() {

    }

    @Override
    public void buildEngine() {

    }

    @Override
    public void buildBathrooms() {
        
    }

    @Override
    public void buildWings() {

    }

    public IAircraft getResult() {
        return boeing747;
    }
}

public class F16Builder extends AircraftBuilder {

    F16 f16;

    @Override
    public void buildEngine() {
        // get F-16 an engine
        // f16.engine = new F16Engine();
    }

    @Override
    public void buildWings() {
        // get F-16 wings
        // f16.wings = new F16Wings();
    }

    @Override
    public void buildCockpit() {
        f16 = new F16();
        // get F-16 a cockpit
        // f16.cockpit = new F16Cockpit();
    }

    public IAircraft getResult() {
        return f16;
    }
}
public class Director {

    AircraftBuilder aircraftBuilder;

    public Director(AircraftBuilder aircraftBuilder) {
        this.aircraftBuilder = aircraftBuilder;
    }

    public void construct(boolean isPassenger) {
        aircraftBuilder.buildCockpit();
        aircraftBuilder.buildEngine();
        aircraftBuilder.buildWings();

        if (isPassenger)
            aircraftBuilder.buildBathrooms();
    }
}
public class Client {

    public void main() {

        F16Builder f16Builder = new F16Builder();
        Director director = new Director(f16Builder);
        director.construct(false);

        IAircraft f16 = f16Builder.getResult();
    }
}
```

## Other Examples
Using the jave api exposes a StringBuilder instance we can successively create a string by using the append method.

## Caveats
The builder pattern might seem similar to the abstract factory pattern but one difference is that the builder pattern creates an object step by step whereas the abstract factory pattern returns the object in one go.