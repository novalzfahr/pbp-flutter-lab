import 'package:tugas_flutter/formBudget.dart';
import 'package:tugas_flutter/displayBudget.dart';
import 'package:tugas_flutter/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _output = 'GENAP';
  MaterialColor _textColor = Colors.red;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _checkParity();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _checkParity();
    });
  }

  void _checkParity() {
    setState(() {
      if (_counter % 2 != 0) {
        _output = 'GANJIL';
        _textColor = Colors.blue;
      } else {
        _output = 'GENAP';
        _textColor= Colors.red;
      }
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_output',
              style: TextStyle(
                color: _textColor
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding (
        padding: const EdgeInsets.only(left:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: _counter > 0,
              child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )
    );
  }
}