<!--ts-->
   * [Dart](#dart)
      * [Data Types](#data-types)
      * [String, Type Conversion, Constant, null](#string-type-conversion-constant-null)
         * [Interpolate](#interpolate)
         * [Conversion](#conversion)
         * [Contsnat](#contsnat)
      * [Operators](#operators)
      * [Loop](#loop)
      * [Collections](#collections)
         * [List](#list)
         * [Set](#set)
         * [Map](#map)
      * [Function](#function)
      * [Class](#class)
         * [Inheritance](#inheritance)
         * [Method overriding](#method-overriding)
      * [Exception Handling](#exception-handling)

<!-- Added by: gil_diy, at: 2019-09-29T02:23+03:00 -->

<!--te-->

# Dart

## Data Types


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

### Contsnat

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


## Function




## Class

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




