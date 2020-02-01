# Summary of 'Clean code' by Robert C. Martin

Code is clean if it can be understood easily – by everyone on the team. Clean code can be read and enhanced by a developer other than its original author. With understandability comes readability, changeability, extensibility and maintainability.

------

## General rules

1. Follow standard conventions.
2. Keep it simple stupid. Simpler is always better. Reduce complexity as much as possible.
3. Boy scout rule. Leave the campground cleaner than you found it.
4. Always find root cause. Always look for the root cause of a problem.

## Design rules

1. Keep configurable data at high levels.
2. Prefer polymorphism to if/else or switch/case.
3. Separate multi-threading code.
4. Prevent over-configurability.
5. Use dependency injection.
6. Follow Law of Demeter. A class should know only its direct dependencies.

## Understandability tips

1. Be consistent. If you do something a certain way, do all similar things in the same way.
2. Use explanatory variables.
3. Encapsulate boundary conditions. Boundary conditions are hard to keep track of. Put the processing for them in one place.
4. Prefer dedicated value objects to primitive type.
5. Avoid logical dependency. Don't write methods which works correctly depending on something else in the same class.
6. Avoid negative conditionals.

## Names rules

1. Choose descriptive and unambiguous names.
2. Make meaningful distinction.
3. Use pronounceable names.
4. Use searchable names.
5. Replace magic numbers with named constants.
6. Avoid encodings. Don't append prefixes or type information.

## Functions rules

1. Small.
2. Do one thing.
3. Use descriptive names.
4. Prefer fewer arguments.
5. Have no side effects.
6. Don't use flag arguments. Split method into several independent methods that can be called from the client without the flag.

## Comments rules

1. Always try to explain yourself in code.
2. Don't be redundant.
3. Don't add obvious noise.
4. Don't use closing brace comments.
5. Don't comment out code. Just remove.
6. Use as explanation of intent.
7. Use as clarification of code.
8. Use as warning of consequences.

## Source code structure

1. Separate concepts vertically.
2. Related code should appear vertically dense.
3. Declare variables close to their usage.
4. Dependent functions should be close.
5. Similar functions should be close.
6. Place functions in the downward direction.
7. Keep lines short.
8. Don't use horizontal alignment.
9. Use white space to associate related things and disassociate weakly related.
10. Don't break indentation.



## Objects and data structures

1. Hide internal structure.
2. Prefer data structures.
3. Avoid hybrids structures (half object and half data).
4. Should be small.
5. Do one thing.
6. Small number of instance variables.
7. Base class should know nothing about their derivatives.
8. Better to have many functions than to pass some code into a function to select a behavior.
9. Prefer non-static methods to static methods.

## Tests

1. One assert per test.
2. Readable.
3. Fast.
4. Independent.
5. Repeatable.

## Code smells

1. Rigidity. The software is difficult to change. A small change causes a cascade of subsequent changes.
2. Fragility. The software breaks in many places due to a single change.
3. Immobility. You cannot reuse parts of the code in other projects because of involved risks and high effort.
4. Needless Complexity.
5. Needless Repetition.
6. Opacity. The code is hard to understand.

# How to write clean code? Lessons learnt from “The Clean Code” — Robert C. Martin

There are two things- Programming and Good Programming. Programming is what we have all been doing. Now is the time to do good programming. We all know that even the bad code works. But it takes time and resources to make a program good. Moreover, other developers mock you when they are trying to find what all is happening in your code. But it’s never too late to care for your programs.

This book has given me a lot of knowledge on what are the best practises and how to actually write code. Now I feel ashamed of my coding skills. Though I always strive to better my code, this book has taught a lot more.

Now, you are reading this blog for two reasons. First, you are a programmer. Second, you want to be a better programmer. Good. We need better programmers.

**Characteristics of a Clean code**:

1. It should be elegant — Clean code should be *pleasing* to read. Reading it should make you smile the way a well-crafted music box or well-designed car would.
2. Clean code is focused —Each function, each class, each module exposes a single-minded attitude that remains entirely undistracted, and unpolluted, by the surrounding details.
3. Clean code is taken care of. Someone has taken the time to keep it simple and orderly. They have paid appropriate attention to details. They have cared.

*4.* Runs all the tests

\5. Contains no duplication

\6. Minimize the number of entities such as classes, methods, functions, and the like.

## How to write Clean code?

## ***Meaningful Names\***

Use intention revealing names. Choosing good names takes time but saves more than it takes.The name of a variable, function, or class, should answer all the big questions. It should tell you why it exists, what it does, and how it is used. If a name requires a comment, then the name does not reveal its intent.

Eg- int d; // elapsed time in days.

> *We should choose a name that specifies what is being measured and the unit of that measurement.*

A better name would be:- int elapsedTime. (Even though the book says elapsedTimeInDays, I would still prefer the former one. Suppose the elapsed time is changed to milliseconds. Then we would have to change long to int and elapsedTimeInMillis instead of elapsedTimeInDays. And for how long we’ll keep changing both the data type and name.)

**Class Names** — Classes and objects should have noun or noun phrase names like Customer, WikiPage, Account, and AddressParser. Avoid words like Manager, Processor, Data, or Info in the name of a class. A class name should not be a verb.

**Method Names —**Methods should have verb or verb phrase names like postPayment, deletePage, or save. Accessors, mutators, and predicates should be named for their value and prefixed with get, set.

When constructors are overloaded, use static factory methods with names that describe the arguments. For example,

Complex fulcrumPoint = Complex.FromRealNumber(23.0); is generally better than Complex fulcrumPoint = new Complex(23.0);

**Pick One Word per Concept —**Pick one word for one abstract concept and stick with it. For instance, it’s confusing to have fetch, retrieve, and get as equivalent methods of different classes. How do you remember which method name goes with which class? Likewise, it’s confusing to have a controller and a manager and a driver in the same code base. What is the essential difference between a DeviceManager and a Protocol- Controller?

## Functions



![img](https://miro.medium.com/max/265/1*-4gyjQwWkHbhW7Mbx5PBKw.png)

The first rule of functions is that they should be small. The second rule of functions is that they should be smaller than that. This implies that the blocks within if statements, else statements, while statements, and so on should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small, but it also adds documentary value because the function called within the block can have a nicely descriptive name.

## Function arguments

A function shouldn’t have more than 3 arguments. Keep it as low as possible. When a function seems to need more than two or three arguments, it is likely that some of those arguments ought to be wrapped into a class of their own. Reducing the number of arguments by creating objects out of them may seem like cheating, but it’s not.

Now when I say to reduce a function size, you would definitely think how to reduce try-catch as it already makes your code so much bigger. My answer is make a function containing just the try-catch-finally statements. And separate the bodies of try/catch/finally block in a separate functions. Eg-

<iframe src="https://medium.com/media/1f2555a26d0f619123703b62d55c9cf3" allowfullscreen="" frameborder="0" height="435" width="680" title="write try-catch-finally cleanly" class="ds t u jf ak" scrolling="auto" style="box-sizing: inherit; top: 0px; left: 0px; width: 680px; position: absolute; height: 435px;"></iframe>

This makes the logic crystal clear. Function names easily describe what we are trying to achieve. Error handling can be ignored. This provides a nice separation that makes the code easier to understand and modify.

**Error Handling is one thing** — Function should do one thing. Error handling is one another thing. If a function has try keyword then it should be the very first keyword and there should be nothing after the catch/finally blocks.

## **Comments**

If you are writing comments to prove your point, you are doing a blunder. Ideally, comments are not required at all. If your code needs commenting, you are doing something wrong. Our code should explain everything. Modern programming languages are english like through which we can easily explain our point. Correct naming can prevent comments.

Legal comments are not considered here. They are necessary to write. Legal comments means copyright and licenses statements.

## Objects and Data Structures

This is a complex topic so pay good attention to it. First we need to clarify the difference between object and Data Structures.

> *Objects hide their data behind abstractions and expose functions that operate on that data. Data structure expose their data and have no meaningful functions.*

These 2 things are completely different. One is just about storing data and other is how to manipulate that data. Consider, for example, the procedural shape example below. The Geometry class operates on the three shape classes. The shape classes are simple data structures without any behavior. All the behavior is in the Geometry class.

<iframe src="https://medium.com/media/fbe63c4be87563514041341e370ceb3b" allowfullscreen="" frameborder="0" height="743" width="680" title="Shape.java" class="ds t u jf ak" scrolling="auto" style="box-sizing: inherit; top: 0px; left: 0px; width: 680px; position: absolute; height: 743px;"></iframe>

Consider what would happen if a perimeter() function were added to Geometry. The shape classes would be unaffected! Any other classes that depended upon the shapes would also be unaffected! On the other hand, if I add a new shape, I must change all the functions in Geometry to deal with it. Again, read that over. Notice that the two conditions are diametrically opposed.

Now consider another approach for the above scenario.

<iframe src="https://medium.com/media/f00dc90f8b1161eeeb3b3255933827d7" allowfullscreen="" frameborder="0" height="589" width="680" title="Shape.java" class="ds t u jf ak" scrolling="auto" style="box-sizing: inherit; top: 0px; left: 0px; width: 680px; position: absolute; height: 589px;"></iframe>

Now we can easily add new Shapes i.e. data structures as compared to previous case. And if we have to add perimeter() function in only one Shape, we are forced to implement that function in all the Shapes as Shape class is an interface containing area() and perimeter() function. This means:

> D*ata structures makes it easy to add new functions without changing the existing data structures. OO code(using objects), makes it easy to add new classes without changing existing functions.*

The complimentary is also true:

> *Procedural code(using data structures) makes it hard to add new data structures because all the functions must change. OO code makes it hard to add new functions because all the classes must change.*

So, the things that are hard for OO are easy for procedures, and the things that are hard for procedures are easy for OO!

In any complex system there are going to be times when we want to add new data types rather than new functions. For these cases objects and OO are most appropriate. On the other hand, there will also be times when we’ll want to add new functions as opposed to data types. In that case procedural code and data structures will be more appropriate.

Mature programmers know that the idea that everything is an object *is a myth*. Sometimes you really *do* want simple data structures with procedures operating on them. So you have to carefully think what to implement also thinking about the future perspective that what will be easy to update. As for in this example, as any new shape can be added in the future, I will pick OO approach for it.

------

I understand it’s hard to write good programs given the timeline in which you have to do your tasks. But till how long you’ll delay? Start slow and be consistent. Your code can do wonders for yourself and mostly for others. I’ve started and found so many mistakes I’ve been doing all the time. Though it has taken some extra hours of my daily time limit, it will pay me in the future.