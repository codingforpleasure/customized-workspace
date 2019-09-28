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
      * [Function](#function)
      * [Class](#class)
      * [Exception Handling](#exception-handling)

<!-- Added by: gil_diy, at: 2019-09-28T13:57+03:00 -->

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


## Function

## Class

```bash
class Num {
	int num = 10;
}
```

## Exception Handling




