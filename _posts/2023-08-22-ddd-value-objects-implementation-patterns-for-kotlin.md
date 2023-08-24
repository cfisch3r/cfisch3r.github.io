---
layout: post
title: DDD Value Objects
subtitle: Implementation Patterns for Kotlin
category: "Domain Driven Design"
fb-img: /images/media/posts/ddd-value-objects-in-kotlin.png
ref: dddvalueobjectsinkotlin
description: "DDD Value Objects in Kotlin"
---

It is exciting for me to learn a new programming language, since it provides me with the opportunity to solve common programming problems more efficiently. In my primary area of work, back office business applications, Domain Driven Design (DDD) is widely used. So, when I switched from Java to Kotlin, I was curious to see how my new main language applies to these patterns . My first step was to learn about implementation alternatives of value objects, a concept for modelling data in DDD.

<!--more-->

## Characteristics of Value Objects

Unlike entities, the other option for modelling data in DDD, value objects have no identity or life cycle. They are characterized by the following attributes:

### Immutability 

Value objects does not have a life cycle. Once created they cannot be changed.

### Structural Equality

As long as all their attributes are equal, two value objects are considered to be the same.

### Self Validating

As soon as you create a value object, it is confirmed to be valid. You do not need to check it again at any other point in the code later.

## An Example

In order to illustrate the different approaches I evaluated, I picked a simple example. A few weeks ago, I bought a kayak to cruise on the Schlei, which inspired me to use a kayak rental service as an example business domain. One of its value objects is the rental period consisting of a start and end date. A valid rental period can be represented as follows:

```json
{
	"start": "2023-04-02",
	"end":   "2023-04-04"
}
```

## Data classes to the rescue

Having said that, we should look at how we can implement this in Kotlin. Kotlin's data classes are the obvious place to put this type of data structure.

```kotlin
data class RentalPeriod(val start: LocalDate, val end: LocalDate)
```

Kotlin's data class definitions are very concise. All you need to do is list the properties of your value object in the primary constructor. Based on these properties, you get `hashcode`- and `equals`-methods that support structural equality right out of the box.

```kotlin
val period1 = RentalPeriod(LocalDate.of(2023,2,4), LocalDate.of(2023,2,6))
val period2 = RentalPeriod(LocalDate.of(2023,2,4), LocalDate.of(2023,2,6))

period1 == period2 // true
```

The `val` keyword, used to indicate read-only properties, ensures that instances of this class are immutable.

```kotlin
val period = RentalPeriod(LocalDate.of(2023,2,4), LocalDate.of(2023,2,6))

period.start = LocalDate.of(2023,7,8) // compiler error
```

But how about self-validation? Currently, we can easily create invalid periods where the start date is after the end date:

```kotlin
val invalidPeriod = RentalPeriod(LocalDate.of(2023,2,6), LocalDate.of(2023,2,2))
```

We can prevent this by validating properties when a new instance of the class is created. In Kotlin, you can do this by defining an `init` block.

```kotlin
data class RentalPeriod(val start: LocalDate, val end: LocalDate) {  
  
    init {  
        require(start < end) { "A rental period requires the start date $start to be before end date $end." }  
    }  
  
}
```

The validation is handled by the `require` function from Kotlin's standard library. It takes the condition for a valid state as its argument. If the condition is not satisfied an `IllegalArgumentException` is thrown. It is also possible to add a block with a more detailed exception message.


It's all going well, but what if the parameters for creating the value object differ from its properties? For example, let's say we want to allow our customers to rent only on a weekly basis, with a minimum of one week and a maximum of four weeks. The start date and the number of weeks for the rental would be parameters in a factory method that reflects this specification:

```kotlin
fun create(start: LocalDate, numberOfWeeks: Int): RentalPeriod = ToDo("Not implemented")
```

Providing this method in a companion object and limiting access to the constructor could be a simple solution.

```kotlin
data class RentalPeriod private constructor(val start: LocalDate, val end: LocalDate) {  
  
    companion object {
      
        fun create(start: LocalDate, numberOfWeeks: Int): RentalPeriod {  
            require(numberOfWeeks in 1..4)
            return RentalPeriod(start, 
		            start.plusWeeks(numberOfWeeks.toLong()))  
        }  
        
    }  
  
}
```

However, there is a catch with the code. Data classes have a public `copy` method which calls the primary constructor directly, so we could circumvent the restrictions of the factory method.

```kotlin
// business rule compliant creation
val period = RentalPeriod.create(LocalDate.of(2023,3,4), 4)  

//now we cheat by using the copy method
val invalidPeriod = period.copy(end = LocalDate.of(2024,4,1))  

invalidPeriod.end < invalidPeriod.start // true
```

The factory method could be moved to the primary constructor as a simple workaround.

```kotlin

data class RentalPeriod(val start: LocalDate, private val numberofWeeks: Int) {

	init {
		require(numberOfWeeks in 1..4)
	}

	val end: LocalDate
			get() = start.plusWeeks(numberOfWeeks.toLong())
}

```

The `numberOfWeeks` is now a private property of the class. This way it is not accessible but can be used for the calculation of the `end`-property.

However, this approach is limited. For example, if we decide that a 3 week rental will have the same end date as a 4 week rental.

```kotlin
data class RentalPeriod(val start: LocalDate, private val numberofWeeks: Int) {

  init {
	require(numberOfWeeks in 1..4)
  }

  val end: LocalDate
		get() = if (numberOfWeeks < 3)
				  start.plusWeeks(numberOfWeeks.toLong())
				else
				  start.plusWeeks(4L)
}
```

For both the 3 and the 4 week options, periods with the same start date have the same end date (start date + 4 weeks). But since the `equals`-method of a value class is generated based on the properties in its primary constructor (`start`and `numberOfWeeks`), the periods are not equal.

```kotlin
val period1 = RentalPeriod(LocalDate.of(2023,3,4), 3)  
val period2 = RentalPeriod(LocalDate.of(2023,3,4), 4)  

period1 != period2 // true, because equality is based on start date and number of weeks instead of start and end date
```

Therefore, this approach cannot be recommended, and we must come up with a more robust solution.

## Sealed class with private data class

There is a long [thread]( https://youtrack.jetbrains.com/issue/KT-11914/Confusing-data-class-copy-with-private-constructor) about different approaches to prevent using the copy method as a bypass for the validation in the factory method. Mark Slater proposed using a sealed class with abstract properties and a private data subclass.

```kotlin
sealed class RentalPeriod {  
  
    abstract val start: LocalDate  
  
    abstract val end: LocalDate  
  
    private data class RentalPeriodData(override val start: LocalDate, override val end: LocalDate): RentalPeriod()  
  
    companion object {  
        fun create(start: LocalDate, numberOfWeeks: Int): RentalPeriod {  
            require(numberOfWeeks in 1..4)  
            return RentalPeriodData(  
                start,  
                start.plusWeeks(numberOfWeeks.toLong())  
            )  
        }  
    }  
}
```

In addition to having quite a bit of boilerplate code, you cannot use the [destructuring feature](https://kotlinlang.org/docs/destructuring-declarations.html) of data classes. Also, the `toString`-Method states the object type as `ReservationData`. But there are still other options to evaluate.

## Inline Value Class

Kotlin introduced inline value classes as wrappers for primitive types. For example, you can define a value class that restricts integers to positive values.

```kotlin
@JvmInline
value class PositiveNumber(val value: Int) {

  init {
	
	require(value > 0) {"The value $value of a positive number has to be greater than 0."}
	
  }

}
```

Currently, value classes can hold only single values, so for our rental period we will need a more generic version of value classes: **multi field value classes**.

## Multi Field Value Class

First of all: At the time of writing this article this feature is in an experimental state. You have to activate it with a compiler flag. Here is an example for an implementation in a Gradle build file:

```kotlin
tasks.withType<KotlinCompile> {
    kotlinOptions.freeCompilerArgs += "-Xvalue-classes"
}
```

Now you can implement the `RentalPeriod` similar to the single-value variant.

```kotlin
@JvmInline
value class RentalPeriod private constructor(val start: LocalDate, val end: LocalDate) {

  companion object {
	
	fun create(start: LocalDate, numberOfWeeks: Int): RentalPeriod {
	  require(numberOfWeeks in 1..4)
	  return RentalPeriod(start, start.plusWeeks(numberOfWeeks.toLong())
	}
		
  }
}
```

## Conclusion

To assist you in finding the best approach for your purpose, I have compiled a table that illustrates the key aspects of each approach.

|                 | Data Class |   Sealed Class   | Value Class | Multi Field Value Class |
| --------------- |:----------:|:----------------:|:-----------:|:-----------------------:|
| Multiple Fields |     Y      |        Y         |      N      |            Y            |
| Factory Method  |     N      |        Y         |      Y      |            Y            |
| Tradeoffs       |            | Boilerplate Code |             |   (yet) experimental    |

If you need to implement value objects in the future, I hope you find it useful. 