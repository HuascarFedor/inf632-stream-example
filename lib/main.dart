import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream in Flutter'),
        ),
        body: const Center(
          child: StreamExample(),
        ),
      ),
    );
  }
}

class StreamExample extends StatefulWidget {
  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  late Stream<int> _counterStream;

  @override
  void initState() {
    super.initState();
    _counterStream = _createCounterStream();
  }

  // Método para crear un Stream que emite un número cada segundo
  Stream<int> _createCounterStream() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _counterStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Text(
            'Counter: ${snapshot.data}',
            style: const TextStyle(fontSize: 24),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}

