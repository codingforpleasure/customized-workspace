<!--ts-->
<!--te-->

# Flutter Async Coding

Title1 | Title2
------------|-----
 element | element-description




## Isolates and events loops
[Link](https://www.youtube.com/watch?v=vl_AaCgudcY)


## Dart Futures 
[Link](https://youtu.be/OTS-ap9_aXc)

* with 'then' we set up a callback after the future returns with a value.

```dart
import `dart:async`;

void main() {
	Future<int> delayed(
		Duration(seconds: 3),
		() { return 100; },
	).then((value){   
		print(value);
	});

	print('waiting for a value...');
}
```

* Checking the error before invoking the callback.

```dart
import `dart:async`;

void main() {
	Future<int> delayed(
		Duration(seconds: 3),
		() { throw 'ERROR!'; },
	).then((value){   
		print(value);
	}).catchError(
		(err) {
			print('Caught $err')
		}
		test: (err) => err.runTimeType == String,
		).whenComplete((){
			print('All finished!');
		}
	);

	print('waiting for a value...');
}
```