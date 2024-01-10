
# Behavioral

- [Iterator](iterator.md)
- [Observer](observer.md)
- [Strategy](strategy.md)
- [Visitor](visitor.md)

Behavioral design patterns dictate the interaction of classes and objects amongst eachother and the delegation of responsibility. These include:

- [x] Interpreter Pattern
- [x] Template Pattern
- [x] Chain of Responsibility Pattern
- [x] Command Pattern
- [x] **Iterator Pattern**
- [x] Mediator Pattern
- [x] Memento Pattern
- [x] **Observer Pattern**
- [x] State Pattern
- [x] **Strategy Pattern**
- [x] **Visitor Pattern**

---

## Iterator Pattern
An iterator is formally defined as a pattern that allows traversing the elements of an aggregate or a collection sequentially without exposing the underlying implementation. All types implementing the java.util.Iterator interface are examples of this pattern.

## Observer Pattern (Publisher/Subscriber)
The pattern is formally defined as a one to many dependency between objects so that when one object changes state all the dependents are notified. All types implementing the interface java.util.EventListener are examples of this pattern.

## Strategy Pattern	
The pattern allows grouping related algorithms under an abstraction, which the client codes against. The abstraction allows switching out one algorithm or policy for another without modifying the client. java.util.Comparator has the method compare() which allows the user to define the algorithm or strategy to compare two objects of the same type.

## Visitor Pattern
The visitor pattern allows us to define an operation for a class or a class hierarchy without changing the classes of the elements on which the operation is performed. The pattern is suitable in scenarios, where the object structure class or the classes that make up its elements don't change often but new operations over the object structure are desired. java.nio.file.FileVisitor interface has an implementation class of SimpleFileVisitor which is an example of a visitor. The interface is defined as a visitor of files. An implementation of this interface is provided to the Files.walkFileTree() methods to visit each file in a file tree.

## Chain of Responsibility Pattern
In a chain of responsibility pattern implementation, the sender's request is passed down a series of handler objects till one of those objects, handles the request or it remains unhandled and falls off the chain. Multiple objects are given a chance to handle the request. This allows us to decouple the sender and the receiver of a request. The log() method of the java.util.logging.Logger class is an example of this pattern.

## Interpreter Pattern
The interpreter pattern converts a language's sentences into its grammar and interprets them.

## Command Pattern
The pattern is defined as representing an action or a request as an object that can then be passed to other objects as parameters, allowing parameterization of clients with requests or actions. The requests can be queued for later execution or logged. Logging requests enables undo operations. Types implementing the interface java.lang.Runnable are examples of this pattern.

## Mediator Pattern
The pattern is applied to encapsulate or centralize the interactions amongst a number of objects. Object orientated design may result in behavior being distributed among several classes and lead to too many connections among objects. The encapsulation keeps the objects from referring to each other directly and the objects don't hold references to each other anymore. The java.util.Timer class represents this pattern where tasks may be scheduled for one-time execution, or for repeated execution at regular intervals in a background thread.

## Memento Pattern
The memento pattern let's us capture the internal state of an object without exposing its internal structure so that the object can be restored to this state later. Classes implementing java.io.Serializable interface are examples of the memento pattern.

## State Pattern
The state pattern encapsulates the various states a machine can be in. The machine or the context, as it is called in pattern-speak, can have actions taken on it that propel it into different states. Without the use of the pattern, the code becomes inflexible and littered with if-else conditionals.

## Template Method
The template method pattern defines the skeleton or steps of an algorithm but leaves opportunities for subclasses to override some of the steps with their own implementations. Non-abstract methods of java.util.AbstractList, java.util.AbstractSet and java.util.AbstractMap are examples of this pattern.

