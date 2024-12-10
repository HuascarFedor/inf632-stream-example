# Ejemplo de Stream en Flutter

Este ejemplo muestra cómo usar un **Stream** en Flutter para generar y escuchar números de forma secuencial, actualizando la consola cada segundo.

## Código

```dart
import 'dart:async';

Stream<int> numberStream() async* {
  int counter = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter++;
  }
}

void main() {
  final stream = numberStream();

  stream.listen((value) {
    print('New number: $value');
  });
}

```
