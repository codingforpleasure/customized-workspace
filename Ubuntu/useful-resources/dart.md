
<p align="center">
  <img src="./images/dart/dart-logo.png" width="500" title="Binary Logistic Regression">
</p>

<!--ts-->
   * [Dart](#dart)
      * [Dart Keywords](#dart-keywords)
      * [Data Types](#data-types)
      * [Types](#types)
      * [String, Type Conversion, Constant, null](#string-type-conversion-constant-null)
         * [Interpolate](#interpolate)
         * [Conversion](#conversion)
         * [Constant](#constant)
            * [What the difference between final to <code>const</code>?](#what-the-difference-between-final-to-const)
      * [Enum](#enum)
      * [Operators](#operators)
      * [Loop](#loop)
      * [Collections](#collections)
         * [List](#list)
            * [Add elements to a list](#add-elements-to-a-list)
            * [List of objects](#list-of-objects)
            * [Generating a list](#generating-a-list)
      * [inbuilt list functions](#inbuilt-list-functions)
         * [Set](#set)
         * [Map](#map)
            * [Generating a map](#generating-a-map)
      * [Function](#function)
         * [Passing function as an argument](#passing-function-as-an-argument)
         * [Return list of objects](#return-list-of-objects)
      * [Class](#class)
         * [Private members](#private-members)
         * [Inheritance](#inheritance)
         * [Method overriding](#method-overriding)
      * [Exception Handling](#exception-handling)
      * [Null Aware Operator](#null-aware-operator)
      * [Async programming](#async-programming)
      * [Conventions](#conventions)

<!-- Added by: gil_diy, at: 2020-05-20T22:54+03:00 -->

<!--te-->

# Dart

## Dart Keywords

[Link](https://dart.dev/guides/language/language-tour#keywords)


## Data Types

Dart is a statically type langauge:

Types
----------
int
bool
double


## String, Type Conversion, Constant, null

### Interpolate

### Conversion
```bash
var one = int.parse('1');
var onePointone = double.parse(1.1);
String oneAstString = 1.toString();
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14')
```

### Constant

```bash
const aConstNum = 0; //int Constant
const aConstBool = true; // bool Constant
const aConstString = 'a constant string'; //string constant

print(aConstNum);
print(aConstBool);
print(aConstString);

print(aConstNum.runTimeType); // Checking the runtime type
print(aConstBool.runTimeType); // Checking the runtime type
print(aConstString.runTimeType); // Checking the runtime type
```


```bash
final Color colour;
```

#### What the difference between `final` to `const`?

```bash
   const int myConst = 2; # Constant variables are immutable
   final int myConst = 3; # Final variables are immutable
```

## Enum

```bash
enum CarType{
   SUV,
   beatle,
   convertible,
   coupe,
}

void main(){

   Car myCar = Car(carStyle: CarType.convertible);
}
```
## Operators

## Loop

```bash
var numbers = [1,2,3];

numbers.forEach( (n) => print(n)); //Arrow function

```

## Collections

### List
```bash
List names = ['Jack', 'Jill'];
print(names[0]);
print(names.length);

```
```bash
var names = ['Jack','Jill',10,100.1];

for (var n in names){
	print(n);
}
```

#### Add elements to a list 
```bash
List list1 = [24, 'Hello', 84];
List list2 = [41, 65];
    
//join list2 to list1
list1.addAll(list2); 

# Here we are adding a single number
list1.add(5555);  
```

#### List of objects

```bash
List <String> names = ['Jack', 'Jill'];

for (var n in names){
	print(n);
}
```

We can see when we assign one object to another object it's not copying the values, the effect we get is  `names2` points on `names`, as we can see below:

```bash
List <String> names = ['Jack', 'Jill'];

var names2 = names;

for (var n in names2){
	print(n);
}
```

Copying the content of a list `names` to `names2` can be done with:
```bash
List <String> names = ['Jack', 'Jill'];

var names2 = [...names];

for (var n in names2){
	print(n);
}
```

#### Generating a list

Generating an simple list:

```bash
var output = List.generate(5, (index) => index*index);
print(output);
```



Generating an list of maps:

```bash
  var output = List.generate(5, (index) {
    return {'name': 'bla' + index.toString(), 'price': Random().nextInt(100)};
  });

  print(output);
```

## inbuilt list functions

[Link](https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2)


### Set

We can see easily that an element in a set cannot appear twice in a set

```bash
var my_set = {'table', 'sofa', 'chair', 'ladder', 'table'};

for (var x in my_set) {
	print(x)
}
```

### Map

For example initializing a map:

```bash
var books = {
	 // key       : Value
	'John green' : 'The fault in our stars',
	'Dan brown'  : 'Daemon and angels',
	'Ernest Hemingway' : 'The Old Man and the Sea'
};

print(books['Dan brown']);
```


Adding key:value to a map:
```bash
var food = Map();
food['green'] = 'Cucumber';
food['red'] = 'Apple';
print(food['red']);


```

```bash
Map<String, int> phoneBook = {
   'Kyle': 835546546,
   'Amy': 114545454,
   'James': 98765321,
   'Tim': 722938475,
}

main(){
   print(phonebook['James']);
   print(phonebook.keys);
   print(phonebook.values);
}
```


#### Generating a map

Here is an example for generating a map of
```bash
  var output = List.generate(5, (index) {
    return {'name': 'bla' + index.toString(), 'price': Random().nextInt(100)};
  });
```

## Function


### Passing function as an argument

```bash
void main(){
   int result = calculator_example1(5,8, multiply);
   print(result)

   result = calculator_example2(5,8, multiply);
   print(result)
}

int calculator_example1(int n1, int n2, function caclulation){
   return caclulation(n1 , n2);
}

function calculator_example2 = (int n1, int n2, function caclulation){
   return caclulation(n1 , n2);
}

int add(int n1, int n2){
   return n1 + n2;
}

int multiply(int n1, int n2){
   return n1 * n2;
}
```

Passing function as an argument in a class
```bash
class Car{
   //Members:
   Function drive;

   // Constructor
   Car({this.drive});
}

void slowDrive(){
   print("Driving slowly");
}

void fastDrive(){
   print("Driving fast");
}

void main() {
   Car myCar = Car(drive: slowDrive);
   myCar.drive()

   myCar.drive = fastDrive; # Upgrading my car, changing the function.
}

```


### Return list of objects
```
<List<object>> getProducts(){

}
```
## Class

### Private members
private members of the class starts with underscore `_`.
```bash
class Person{
   int _age;
   ...
   ...

}
```
```bash
class Person {
	String name;
   int age;

   Person(String name, [int age = 18]){
      this.name = name;
      this.age = age;
   }

   void showOutput(){
      print(name);
      print(age);
   }
}

void main() {
   Person person1 = Person('Omer');

   person1.name = 'Gil'
   person1.age = 35;
   person1.showOutput();
}
```


### Inheritance

```bash
class Vehicle {
   String model;
   int year;

   Vehicle(this.model, this.year) {
      print(this.model);
      print(this.year);
   }

   void showOutput(){
      print(model);
      print(year);
   }
}

class Car extends Vehicle {
   double price;

   Car(String model, int year, this.price): super(model, year);

   void showOutput(){
      super.showOutput();
      print(this.price);
   }
}

void main() {
   var car1 = Car('Accord', 2014,150000);
   car1.showOutput();
}
```
### Method overriding

```bash
class X{
   String name;

   X(this.name);

   void showOutput(){
      print(this.name);
   }

   dynamic sqaure(dynamic val) {
      return val * val;
   }
}

class Y extends X{

   Y(String name) : super(name);

   @override
   void showOutput(){
      print(this.name);
      print('Hello');
   }
}
```

## Exception Handling

```bash
try {
 	double myStringAsADouble = double.parse(myString);
 	print(myStringAsADouble + 5);
} catch (e) {
	print(e);
}
```

## Null Aware Operator

```bash
someVairable ?? defaultValue
```

So if someVairable equal to null, use the defaultValue.

## Async programming

Asynchronous operations let your program complete work while waiting for another operation to finish. Here are some common asynchronous operations:

* Fetching data over a network.
* Writing to a database.
* Reading data from a file.

[Great reference for asynchronous programming](https://dart.dev/codelabs/async-await)


**Simple sync example:**

```bash
import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 3);
  sleep(threeSeconds); // sleep is Synchronize function

  String result = 'task 2 data';
  print('Task 2 complete');
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
```

**Simple async example:**
```bash
import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2_Result = await task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// Asynchronous programming in action
// We have to wait before we actually get the result
Future <String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;

  // future means it's an Asynchronous method
  Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
```




## Conventions

* Constant should start with the character `k`.

* Class names are Pascal case, for example: `CalculatorBrain`.


No matter the size of the column it will stretch:

crossAxisAlignment: crossAxisAlignment.stretch


